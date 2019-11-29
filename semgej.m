%% musi tam byt
COM_CloseNXT all
clc, clear, close

nxt = COM_OpenNXT();
COM_SetDefaultNXT(nxt);
%% nastaveni senzoru
colors = [];
OpenNXT2Color(SENSOR_4,'FULL');
while 1
  %jede dopredu a precte barvu a otoci motorem kdyz je tam kulicka
  goStraight('C', 'B', -20);
  colors = readBallColor(SENSOR_4,'A',colors);
end
%% musi tam byt
COM_CloseNXT(nxt);