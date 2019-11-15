COM_CloseNXT all
clc, clear, close;

nxt = COM_OpenNXT();
COM_SetDefaultNXT(nxt);

motA = NXTMotor('A', 'Power', 50, 'SpeedRegulation', false, 'TachoLimit', 90, 'ActionAtTachoLimit', 'HoldBrake');  % HoldBrake vs Brake
motA.SendToNXT();

for i = 1:100
    data = motA.ReadFromNXT();
    data.Position
    pause(0.1);
end
pause(10);

motA.Stop('off');
% motA.Stop('brake');
COM_CloseNXT(nxt);