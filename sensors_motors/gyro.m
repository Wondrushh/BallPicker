COM_CloseNXT all
clc, clear, close;

% NXT initialization
nxt = COM_OpenNXT();
COM_SetDefaultNXT(nxt);

port = SENSOR_1;

OpenGyro(port);

CalibrateGyro(port, 'AUTO');
offset = GetGyro(port);


for i = 1:100    
    speed = GetGyro(port)
    pause(0.1);    
end

CloseSensor(SENSOR_1);
COM_CloseNXT(nxt);