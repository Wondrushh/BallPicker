function sorting(leftMotor, rightMotor, conveyorMotor, colorVec, rearColorSensor)
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
degreeTurn = 120;
conveyorPower = -20;
speed = 10;
goBack(leftMotor, rightMotor, speed)
pause(6);
StopMotor('all','off');
pause(1);

%otoci se
motLeft = NXTMotor(leftMotor,'Power', -speed);
motRight = NXTMotor(rightMotor, 'Power', speed);
motLeft.SendToNXT();
motRight.SendToNXT();

pause(6.6) %pri rychlosti 10 funguje velmi dobre

StopMotor('all','off');

% conveyor = NXTMotor(conveyorMotor, 'Power', conveyorPower, 'SpeedRegulation', false, 'TachoLimit', degreeTurn, 'ActionAtTachoLimit', 'HoldBrake');
% conveyor.SendToNXT();
%pause(5.5);
%% pas se posune o pozadovany kus podle poctu kulicek
% conveyor = NXTMotor(conveyorMotor, 'Power', conveyorPower, 'SpeedRegulation', false, 'TachoLimit', degreeTurn*0, 'ActionAtTachoLimit', 'HoldBrake');
% conveyor.SendToNXT();
% pause(0.3);
% colorVec = [1,1]; %SMAZAT
%% pojede dopredu, dokud neuvidi cervenou caru a zpomali, bude hledat barvu a az ji najde, zpet do zadu a znova
for i = 1:numel(colorVec)
  
  goBack(leftMotor,rightMotor,ceil(speed*0.85));
  while 1 %skenuje barvy
    color = GetNXT2Color(rearColorSensor)
    switch color 
      case 'WHITE' %zalezi na prvni barve
      StopMotor('all','off')
      break
    end
  end
  
  pause(0.2);
  while 1 %zacne jet pomalinku dopredu a zkoumat barvy, az narazi na tu co ma ve vektoru, vyklopi ji
    color = GetNXT2Color(rearColorSensor)
    goBack(leftMotor,rightMotor,ceil(speed*0.5));
    
    switch color
      case 'RED' 
        if colorVec(i) == 1
          pause(1.7)
          StopMotor('all','off');
          conveyor = NXTMotor(conveyorMotor, 'Power', conveyorPower, 'SpeedRegulation', false, 'TachoLimit', degreeTurn, 'ActionAtTachoLimit', 'HoldBrake');
          conveyor.SendToNXT();
          pause(3);
          goStraight(leftMotor, rightMotor, speed)
          pause(5);
          StopMotor('all','off');
          break
        end
      case 'GREEN'
        if colorVec(i) == 2
          pause(1.7)
          StopMotor('all','off');
          conveyor = NXTMotor(conveyorMotor, 'Power', conveyorPower, 'SpeedRegulation', false, 'TachoLimit', degreeTurn, 'ActionAtTachoLimit', 'HoldBrake');
          conveyor.SendToNXT();
          pause(3);
          goStraight(leftMotor, rightMotor, speed+5)
          pause(5);
          StopMotor('all','off');
          break
        end
      case 'YELLOW'
        if colorVec(i) == 4
          pause(1.7)
          StopMotor('all','off');
          conveyor = NXTMotor(conveyorMotor, 'Power', conveyorPower, 'SpeedRegulation', false, 'TachoLimit', degreeTurn, 'ActionAtTachoLimit', 'HoldBrake');
          conveyor.SendToNXT();
          pause(3);
          goStraight(leftMotor, rightMotor, speed+5)
          pause(7);
          StopMotor('all','off');
          break
        end
    end
    pause(0.3);
    %POZOR! Nezapomenout zmenit u pasu Brake na HoldBrake kdyby byl
    %problem.
  end
end
end

