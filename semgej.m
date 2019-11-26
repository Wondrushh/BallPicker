%% musi tam byt
COM_CloseNXT all
clc, clear, close;

nxt = COM_OpenNXT();
COM_SetDefaultNXT(nxt);
%% nastaveni senzoru
colors = [];
OpenNXT2Color(SENSOR_4,'FULL');
%precte barvu a otoci motorem kdyz je tam kulicka
readBallColor(SENSOR_4,'A',colors);


%% musi tam byt
COM_CloseNXT(nxt);