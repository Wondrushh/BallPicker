COM_CloseNXT all
clc, clear, close;

nxt = COM_OpenNXT();
COM_SetDefaultNXT(nxt);

motA = NXTMotor('A', 'Power',  0, 'SpeedRegulation', false);

motA.Power = 50;
motA.SendToNXT();
pause(10);

motA.Stop('off');
% motA.Stop('brake');
COM_CloseNXT(nxt);