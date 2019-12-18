COM_CloseNXT all
clear, close;

nxt = COM_OpenNXT('bluetooth.ini');
COM_SetDefaultNXT(nxt);

%% FULL color - outputs 'BLACK', 'BLUE', 'GREEN', 'YELLOW', 'RED', 'WHITE'
OpenNXT2Color(SENSOR_4, 'FULL');

for i = 1:10000   
    color = GetNXT2Color(SENSOR_4)
    pause(0.1);
end
CloseSensor(SENSOR_4);

%% 'RED', 'GREEN', 'BLUE', 'NONE' mode - 0 1023

for i = 1:50
    OpenNXT2Color(SENSOR_4, 'RED');
    color_r = GetNXT2Color(SENSOR_4)
    CloseSensor(SENSOR_4);
    OpenNXT2Color(SENSOR_4, 'GREEN');
    color_g = GetNXT2Color(SENSOR_4)
    CloseSensor(SENSOR_4);
    OpenNXT2Color(SENSOR_4, 'BLUE');
    color_b = GetNXT2Color(SENSOR_4)
    CloseSensor(SENSOR_4);
    pause(0.1);
end

CloseSensor(SENSOR_4);

%% 'NONE' mode - 0 1023

OpenNXT2Color(SENSOR_4, 'NONE');

for i = 1:100    
    brightness = GetNXT2Color(SENSOR_4)    
    pause(0.1);
end

CloseSensor(SENSOR_4);
COM_CloseNXT(nxt);