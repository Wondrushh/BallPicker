%% musi tam byt
COM_CloseNXT all
clc, clear, close
nxt = COM_OpenNXT('bluetooth.ini'); %bluetooth.ini
COM_SetDefaultNXT(nxt);
%% nastaveni senzoru a motoru
colors = [];
colorSensor = SENSOR_1;
rearSensor = SENSOR_4;
conveyorMotor = 'A';
rightMotor = 'B';
leftMotor = 'C';
motorSpeed = 8;
numberOfBalls = 3;
turn = 0; %kdyz je 1, vykona se otocka
turnDirection = 0; %0 je doleva, 1 je doprava
rateOfTurn = 9;
OpenNXT2Color(colorSensor, 'FULL');
OpenNXT2Color(rearSensor, 'FULL');
i = 0;
while 1
  %jede dopredu a precte barvu a otoci motorem kdyz je tam kulicka, kdyz
  %uvidi cernou, otoci se
  i = i+1
  goStraight(rightMotor, leftMotor, motorSpeed);
  [colors,turn] = readBallColor(colorSensor,conveyorMotor,colors);
  if turn == 1 % kdyz readBallColor vyda prikaz na otaceni, robot se otoci
    turnDirection = goTurn(leftMotor,rightMotor,motorSpeed,turnDirection);
    pause(0.3);
    turn = 0;
  end
  if numel(colors) == numberOfBalls
    break
  end
end
%% zacne hledat kalisky a tridit

startSorting = 0;
while 1
  %jede dopredu a precte barvu, kdyz je cerna, otoci se, kdyz cervena,
  %zacne sortovat
  goStraight(rightMotor, leftMotor, motorSpeed);
  [startSorting, turn] = searchForSort(colorSensor);
  if startSorting == 1 %kdyz startSorting ma hodnotu 1, spusti se skript na trideni
    sorting(leftMotor,rightMotor,conveyorMotor,colors,rearSensor);
    break
  end
  
  if turn == 1 % kdyz searchForSort vyda prikaz na otaceni, robot se otoci
    turnDirection = goTurn(leftMotor,rightMotor,motorSpeed,turnDirection);
    pause(0.3);
    turn = 0;
  end
end
%% musi tam byt
COM_CloseNXT(nxt);