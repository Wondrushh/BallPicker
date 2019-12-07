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
    pause(1);
    turn = 0;
  end
  if numel(colors) == 8
    break
  end
end
%% zacne hledat kalisky

%% musi tam byt
COM_CloseNXT(nxt);