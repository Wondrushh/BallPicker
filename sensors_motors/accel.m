COM_CloseNXT all
clear, close;

nxt = COM_OpenNXT();
COM_SetDefaultNXT(nxt);

OpenAccelerator(SENSOR_1);

for i = 1:100   
        acc_Vector = GetAccelerator(SENSOR_1)
        pause(0.1);
end

CloseSensor(SENSOR_1);
COM_CloseNXT(nxt);