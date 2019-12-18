COM_CloseNXT all
clc, clear, close;

nxt = COM_OpenNXT();
COM_SetDefaultNXT(nxt);

motA = NXTMotor('A', 'Power', -20, 'SpeedRegulation', false, 'TachoLimit', 120*6, 'ActionAtTachoLimit', 'Brake');  % HoldBrake vs Brake
motA.SendToNXT();
pause(2);
% motA.Stop('brake');
COM_CloseNXT(nxt);