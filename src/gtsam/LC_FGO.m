import gtsam.*;
disp('Loosely-coupled Factor Graph Optimization')

%% Read metadata and compute relative sensor pose transforms
% IMU metadata
disp('-- Reading sensor metadata')
IMU_metadata = importdata('KittiEquivBiasedImu_metadata.txt');
IMU_metadata = cell2struct(num2cell(IMU_metadata.data), IMU_metadata.colheaders, 2);
IMUinBody = Pose3.Expmap([IMU_metadata.BodyPtx; IMU_metadata.BodyPty; IMU_metadata.BodyPtz;
  IMU_metadata.BodyPrx; IMU_metadata.BodyPry; IMU_metadata.BodyPrz; ]);
if ~IMUinBody.equals(Pose3, 1e-5)
  error 'Currently only support IMUinBody is identity, i.e. IMU and body frame are the same';
end

%% Read data
disp('-- Reading sensor data from file')
% IMU data
IMU_data = importdata('fgo_IMU_data_abrev.txt');
IMU_data = cell2struct(num2cell(IMU_data.data), IMU_data.colheaders, 2);
imum = cellfun(@(x) x', num2cell([ [IMU_data.accelX]' [IMU_data.accelY]' [IMU_data.accelZ]' [IMU_data.omegaX]' [IMU_data.omegaY]' [IMU_data.omegaZ]' ], 2), 'UniformOutput', false);
[IMU_data.acc_omega] = deal(imum{:});
clear imum

% GPS data
GPS_data = importdata('fgo_GNSS_pos_abrev.txt');
NR = GPS_data.data(:,2:4);
GPS_data = cell2struct(num2cell(GPS_data.data), GPS_data.colheaders, 2);
for i = 1:numel(GPS_data)
    GPS_data(i).Position = gtsam.Point3(GPS_data(i).X, GPS_data(i).Y, GPS_data(i).Z);
end
noiseModelGPS = noiseModel.Diagonal.Precisions([ [0;0;0]; 1.0/0.07 * [1;1;1] ]);
firstGPSPose = 2;
finalGPSPose = 500;

%% Get initial conditions for the estimated trajectory
currentPoseGlobal = Pose3(Rot3, GPS_data(firstGPSPose).Position); % initial pose is the reference frame (navigation frame)
currentVelocityGlobal = LieVector([0;0;0]); % the vehicle is stationary at the beginning
currentBias = imuBias.ConstantBias(zeros(3,1), zeros(3,1));
sigma_init_x = noiseModel.Isotropic.Precisions([ 0.0; 0.0; 0.0; 1; 1; 1 ]);
sigma_init_v = noiseModel.Isotropic.Sigma(3, 1000.0);
sigma_init_b = noiseModel.Isotropic.Sigmas([ 0.100; 0.100; 0.100; 5.00e-05; 5.00e-05; 5.00e-05 ]);
sigma_between_b = [ IMU_metadata.AccelerometerBiasSigma * ones(3,1); IMU_metadata.GyroscopeBiasSigma * ones(3,1) ];
g = [0;0;-9.8];
w_coriolis = [0;0;0];

%% Factor Graph
graph = NonlinearFactorGraph;
initial = Values;

%% Main loop:
% read measurements and add factors to graph
IMUtimes = [IMU_data.Time];

disp('-- Creating Factor Graph')

for measurementIndex = firstGPSPose:length(GPS_data)
  
  % At each non=IMU measurement we initialize a new node in the graph
  currentPoseKey = symbol('x',measurementIndex);
  currentVelKey =  symbol('v',measurementIndex);
  currentBiasKey = symbol('b',measurementIndex);
  t = GPS_data(measurementIndex, 1).Time;
  
  if measurementIndex == firstGPSPose
    %% Create initial estimate and prior on initial pose, velocity, and biases
    initial.insert(currentPoseKey, currentPoseGlobal);
    initial.insert(currentVelKey, currentVelocityGlobal);
    initial.insert(currentBiasKey, currentBias);
    graph.add(PriorFactorPose3(currentPoseKey, currentPoseGlobal, sigma_init_x));
    graph.add(PriorFactorLieVector(currentVelKey, currentVelocityGlobal, sigma_init_v));
    graph.add(PriorFactorConstantBias(currentBiasKey, currentBias, sigma_init_b));
  else
    t_previous = GPS_data(measurementIndex-1, 1).Time;
    %% Summarize IMU data between the previous GPS measurement and now
    IMUindices = find(IMUtimes >= t_previous & IMUtimes <= t);
    
    currentSummarizedMeasurement = gtsam.ImuFactorPreintegratedMeasurements( ...
      currentBias, IMU_metadata.AccelerometerSigma.^2 * eye(3), ...
      IMU_metadata.GyroscopeSigma.^2 * eye(3), IMU_metadata.IntegrationSigma.^2 * eye(3));
    
    for imuIndex = IMUindices
      accMeas = [ IMU_data(imuIndex).accelX; IMU_data(imuIndex).accelY; IMU_data(imuIndex).accelZ ];
      omegaMeas = [ IMU_data(imuIndex).omegaX; IMU_data(imuIndex).omegaY; IMU_data(imuIndex).omegaZ ];
      deltaT = IMU_data(imuIndex).dt;
      currentSummarizedMeasurement.integrateMeasurement(accMeas, omegaMeas, deltaT);
    end
    
    % Create IMU factor
    graph.add(ImuFactor( ...
      currentPoseKey-1, currentVelKey-1, ...
      currentPoseKey, currentVelKey, ...
      currentBiasKey, currentSummarizedMeasurement, g, w_coriolis));
    
    % Bias evolution as given in the IMU metadata
    graph.add(BetweenFactorConstantBias(currentBiasKey-1, currentBiasKey, imuBias.ConstantBias(zeros(3,1), zeros(3,1)), ...
      noiseModel.Diagonal.Sigmas(sqrt(numel(IMUindices)) * sigma_between_b)));

    % Create GPS factor
    GPSPose = Pose3(currentPoseGlobal.rotation, GPS_data(measurementIndex).Position);
    if mod(measurementIndex, GPSskip) == 0
      graph.add(PriorFactorPose3(currentPoseKey, GPSPose, noiseModelGPS));
    end

    % Add initial value
    initial.insert(currentPoseKey, GPSPose);
    initial.insert(currentVelKey, currentVelocityGlobal);
    initial.insert(currentBiasKey, currentBias);
    
  end
   
end % end main loop

%% Optimize
optimizer = DoglegOptimizer(graph, initial);
result = optimizer.optimizeSafely();

%% Plot
% FGO 
figure
plot3DTrajectory(result, 'b-')
% original NR 
hold on
scatter3(NR(:,1),NR(:,2),NR(:,3),'g');
hold off
legend('LC FGO','Newton-Raphson');
title('Estimated trajectory')
xlabel('[m]')
ylabel('[m]')
zlabel('[m]')
axis equal