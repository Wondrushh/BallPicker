COM_CloseNXT all
clear, close;

nxt = COM_OpenNXT();
COM_SetDefaultNXT(nxt);

OpenUltrasonic(SENSOR_2);

for i = 1:100   
        distance = GetUltrasonic(SENSOR_2)
        pause(0.1);
end

CloseSensor(SENSOR_2);
COM_CloseNXT(nxt);