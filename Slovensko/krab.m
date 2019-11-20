COM_CloseNXT all
clc, clear, close;

nxt = COM_OpenNXT();
COM_SetDefaultNXT(nxt);

motA = NXTMotor('A', 'Power', 50, 'SpeedRegulation', false, 'TachoLimit',150, 'ActionAtTachoLimit', 'HoldBrake');  % HoldBrake vs Brake
motA.SendToNXT();

    data = motA.ReadFromNXT();
    data.Position
    pause(0.1);

   pause(1)
motA.Stop('brake');
COM_CloseNXT(nxt);

COM_CloseNXT all

nxt = COM_OpenNXT();
COM_SetDefaultNXT(nxt);

motA = NXTMotor('A', 'Power', -50, 'SpeedRegulation', false, 'TachoLimit', 800, 'ActionAtTachoLimit', 'HoldBrake');  % HoldBrake vs Brake
motA.SendToNXT();

    data = motA.ReadFromNXT();
    data.Position
    pause(1);

motA.Stop('off');
% motA.Stop('brake');
COM_CloseNXT(nxt);