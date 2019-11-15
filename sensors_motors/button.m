COM_CloseNXT all
clear, close;

nxt = COM_OpenNXT();
COM_SetDefaultNXT(nxt);

OpenSwitch(SENSOR_3);

for i = 1:100   
        switchStateInv = ~GetSwitch(SENSOR_3)
        switchState = GetSwitch(SENSOR_3)
        pause(0.1);
end

CloseSensor(SENSOR_3);
COM_CloseNXT(nxt);