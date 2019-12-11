function sorting(leftMotor, rightMotor, conveyorMotor, colorVec, rearColorSensor, speed, degreeTurn)
%Robot zacne vysypavat kulicky dle barvy na zemi
%   Robot nejdriv zpozoruje cervenou, pote zpomali a ceka na to az najde
%   pozadovanou barvu kterou ma v zasobniku.
% leftMotor - output pro levy motor
% rigthMotor - output pro pravy motor
% conveyorMotor - output pro motor, ktery otaci pasem
% colorVec - vektor, ve kterem je obsazen seznam pohlcenych barev
% rearColorSensor - input pro senzor, ktery je v zadu
% speed - rychlost, kterou se bude pohybovat
%% Robot popojede dozadu a nejdrive se otoci
goBack(leftMotor, rightMotor, speed)

StopMotor('all','off');
pause(0.2);

%otoci se
motLeft = NXTMotor(leftMotor,'Power', -50);
motRight = NXTMotor(rightMotor, 'Power', 50);
motLeft.SendToNXT();
motRight.SendToNXT();

pause(0.5) %UPRAVIT

StopMotor('all','off');
%% pas se posune o pozadovany kus podle poctu kulicek
conveyor = NXTMotor(conveyorMotor, 'Power', -50, 'SpeedRegulation', false, 'TachoLimit', degreeTurn*5, 'ActionAtTachoLimit', 'HoldBrake');
conveyor.SendToNXT();
%% pojede dopredu, dokud neuvidi cervenou caru a zpomali, bude hledat barvu a az ji najde, zpet do zadu a znova
for i = 1:numel(colorVec)
  color = [];
  goStraight(leftMotor,rightMotor,ceil(speed*0.65));
  while 1 %skenuje barvy
    color = GetNXT2Color(rearColorSensor);
    if color == 'RED' %zalezi na prvni barve
      StopMotor('all','off')
      break
    end
  end
  pause(0.2);
  while 1 %zacne jet pomalinku dopredu a zkoumat barvy, az narazi na tu co ma ve vektoru, vyklopi ji
    color = GetNXT2Color(rearColorSensor);
    goStraight(leftMotor,rightMotor,ceil(speed*0.3));
    if color == 'RED' && colorVec(i) == 1
      pause(0.3)
      StopMotor('all','off');
      conveyor = NXTMotor(conveyorMotor, 'Power', -50, 'SpeedRegulation', false, 'TachoLimit', degreeTurn, 'ActionAtTachoLimit', 'HoldBrake');
      conveyor.SendToNXT();
      pause(0.5);
      goBack(leftMotor, rightMotor, speed)
      pause(2);
      StopMotor('all','off');
      break
    elseif color == 'GREEN' && colorVec(i) == 2
      pause(0.3)
      StopMotor('all','off');
      conveyor = NXTMotor(conveyorMotor, 'Power', -50, 'SpeedRegulation', false, 'TachoLimit', degreeTurn, 'ActionAtTachoLimit', 'HoldBrake');
      conveyor.SendToNXT();
      pause(0.5);
      goBack(leftMotor, rightMotor, speed)
      pause(2);
      StopMotor('all','off');
      break
      %      elseif color == 'BLUE' && colorVec(i) == 3
      %       pause(0.3)
      %       StopMotor('all','off');
      %       conveyor = NXTMotor(conveyorMotor, 'Power', -50, 'SpeedRegulation', false, 'TachoLimit', degreeTurn, 'ActionAtTachoLimit', 'HoldBrake');
      %       conveyor.SendToNXT();
      %       pause(0.5);
      %       goBack(leftMotor, rightMotor, speed)
      %       pause(2);
      %       StopMotor('all','off');
      %       break
    elseif color == 'YELLOW' && colorVec(i) == 4
      pause(0.3)
      StopMotor('all','off');
      conveyor = NXTMotor(conveyorMotor, 'Power', -50, 'SpeedRegulation', false, 'TachoLimit', degreeTurn, 'ActionAtTachoLimit', 'HoldBrake');
      conveyor.SendToNXT();
      pause(0.5);
      goBack(leftMotor, rightMotor, speed)
      pause(2);
      StopMotor('all','off');
      break
    end
    %POZOR! Nezapomenout zmenit u pasu Brake na HoldBrake kdyby byl
    %problem.
  end
end
end

