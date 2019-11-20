COM_CloseNXT all
clc, clear, close;

nxt = COM_OpenNXT();
COM_SetDefaultNXT(nxt);
OpenNXT2Color(SENSOR_4, 'FULL');
while 1
color = GetNXT2Color(SENSOR_4)

motA= NXTMotor('A', 'Power',  0);

   switch color
       case 'BLACK'
        motA.Power = 0;
        motA.SendToNXT();
       case 'WHITE'
        motA.Power = 100;
        motA.SendToNXT();
       case 'RED'
        motA.Power = -50;
        motA.SendToNXT();
           
   end
end
    

