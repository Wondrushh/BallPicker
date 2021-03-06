function [colorVec,turnOut] = readBallColor(sensorPort,motorPort,colorVecInp)
%% Funkce precte barvu kulicky, posune pasem a zapise kulicku do vektoru

      %sensorPort = port, do ktereho se pripoji RGB sensor
      %motorPort = port, do ktereho se pripoji motor, ktery hybe pasem
      %colorVec = vektor, do ktereho se uklada poradi kulicek
%% telo funkce
  colorVec = colorVecInp;
  degreeTurn = 120;
  defPower = -20;
  pauseSec = 3;
  buffer = 4;
  color = GetNXT2Color(sensorPort)
  switch color
    case 'RED'
      pause(pauseSec);
      motA = NXTMotor(motorPort, 'Power', defPower, 'SpeedRegulation', false, 'TachoLimit', degreeTurn, 'ActionAtTachoLimit', 'Brake');
      motA.SendToNXT()
      %prida se do vektoru 1
      colorVec(end+1) = 1;
      disp('cervena')
      pause(1.5);
      turnOut = 0;
    case 'GREEN'
      pause(pauseSec);
      motA = NXTMotor(motorPort, 'Power', defPower, 'SpeedRegulation', false, 'TachoLimit', degreeTurn, 'ActionAtTachoLimit', 'Brake');
      motA.SendToNXT()
      %prida se do vektoru 2
      colorVec(end+1) = 2;
      disp('zelena')
      pause(1.5);
      turnOut = 0;
%     case 'BLUE'
%       pause(1);
%       motA = NXTMotor(motorPort, 'Power', defPower, 'SpeedRegulation', false, 'TachoLimit', degreeTurn, 'ActionAtTachoLimit', 'Brake');
%       motA.SendToNXT()
%       %prida se do vektoru 3
%       colorVec(end+1) = 3;
%       disp('modra')
%       pause(3);
%       turnOut = 0;
    case 'YELLOW'
      pause(pauseSec);
      motA = NXTMotor(motorPort, 'Power', defPower, 'SpeedRegulation', false, 'TachoLimit', degreeTurn, 'ActionAtTachoLimit', 'Brake');
      motA.SendToNXT()
      %prida se do vektoru 4
      colorVec(end+1) = 4;
      disp('zluta')
      pause(1.5);
      turnOut = 0;
    case 'BLACK'
      for i = 1:buffer
        color = GetNXT2Color(sensorPort)
        switch color
          case 'BLACK'
            continue
          otherwise
            turnOut = 0;
          break
        end
      end
      if i == buffer
        turnOut = 1;
        return
      end 
    case 'BLUE'
      turnOut = 1;
      return
    otherwise
%       pause(0.05)
      turnOut = 0;
  end

end