%% musi tam byt
COM_CloseNXT all
clc, clear, close
nxt = COM_OpenNXT(); %bluetooth.ini
COM_SetDefaultNXT(nxt);
%% nastaveni senzoru a motoru
colors = [];
colorSensor = SENSOR_4;
conveyorMotor = 'A';
rightMotor = 'B';
leftMotor = 'C';
motorSpeed = 10;
turn = 0; %kdyz je 1, vykona se otocka
turnDirection = 0; %0 je doleva, 1 je doprava
OpenNXT2Color(colorSensor,'FULL');
while 1
  %jede dopredu a precte barvu a otoci motorem kdyz je tam kulicka, kdyz
  %uvidi cernou, otoci se
  goStraight(rightMotor, leftMotor, motorSpeed);
  [colors,turn] = readBallColor(colorSensor,conveyorMotor,colors);
  if turn == 1 % kdyz readBallColor vyda prikaz na otaceni, robot se otoci
    turnDirection = goTurn(leftMotor,rightMotor,motorSpeed,turnDirection);
    pause(0.3);
    turn = 0;
  end
  if numel(colors) == 3
    break
  end
end
%% zacne hledat kalisky

startSorting = 0;
while 1
  %jede dopredu a precte barvu, kdyz je cerna, otoci se, kdyz cervena,
  %zacne sortovat
  goStraight(rightMotor, leftMotor, motorSpeed);
  [startSorting, turnOut] = searchForSort(colorSensor);
  if startSorting == 1 %kdyz 
    sorting()
  end
  
  if turn == 1 % kdyz readBallColor vyda prikaz na otaceni, robot se otoci
    turnDirection = goTurn(leftMotor,rightMotor,motorSpeed,turnDirection);
    pause(0.3);
    turn = 0;
  end
end
%% musi tam byt
COM_CloseNXT(nxt);