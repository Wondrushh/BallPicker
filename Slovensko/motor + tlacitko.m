COM_CloseNXT all
clc, clear, close;

nxt = COM_OpenNXT();
COM_SetDefaultNXT(nxt);
OpenSwitch(SENSOR_3);

motA= NXTMotor('A', 'Power',  0);
stav = 0
mujcas=tic
while 1
    
    switchStateInv = GetSwitch(SENSOR_3);
    pause(0.1);
    if switchStateInv
        if toc(mujcas) <0.5
            continue
        end
         stav=~stav;
         
         mujcas=tic;
    end
   switch stav
       case 0
        motA.Power = 0;
        motA.SendToNXT();
       case 1
        motA.Power = 100;
        motA.SendToNXT();
   end
    
    
end
% m=1
% switch m
%     case 1
%     motA.Power = i;
%     motA.SendToNXT();
%     pause(0.05);


% motA.Stop('off');
motA.Stop('break');
COM_CloseNXT(nxt);