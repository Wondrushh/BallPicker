COM_CloseNXT all
clc, clear, close;

nxt = COM_OpenNXT();
COM_SetDefaultNXT(nxt);
motA= NXTMotor('A', 'Power',  0);
motA.Power = 50;
    motA.SendToNXT();
    pause(0.05);