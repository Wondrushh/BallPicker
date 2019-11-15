COM_CloseNXT all
clc, clear, close;

nxt = COM_OpenNXT();
COM_SetDefaultNXT(nxt);

motA = NXTMotor('A', 'Power',  0);

for i = -100:100
    motA.Power = i;
    motA.SendToNXT();
    pause(0.05);
end

% motA.Stop('off');
motA.Stop('brake');
COM_CloseNXT(nxt);