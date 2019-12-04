%% musi tam byt
COM_CloseNXT all
clc, clear, close

nxt = COM_OpenNXT();
COM_SetDefaultNXT(nxt);
%% nastaveni senzoru a motoru
colors = [];
colorSensor = SENSOR_4;
OpenNXT2Color(colorSensor,'FULL');
conveyorMotor = 'A';
rightMotor = 'B';
leftMotor = 'C';
turn = 1; %1 je doprava, 0 je doleva
while 1
  %jede dopredu a precte barvu a otoci motorem kdyz je tam kulicka, kdyz
  %uvidi cernou, otoci se 
  goStraight(rightMotor, leftMotor, -20);
  colors = readBallColor(colorSensor,conveyorMotor,colors);
end
%% musi tam byt
COM_CloseNXT(nxt);