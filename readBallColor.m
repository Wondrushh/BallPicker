function colorVec = readBallColor(sensorPort,motorPort,colorVecInp)
%% Funkce precte barvu kulicky, posune pasem a zapise kulicku do vektoru

      %sensorPort = port, do ktereho se pripoji RGB sensor
      %motorPort = port, do ktereho se pripoji motor, ktery hybe pasem
      %colorVec = vektor, do ktereho se uklada poradi kulicek
%% telo funkce
  colorVec = colorVecInp;
  degreeTurn = 180;
  defPower = -50;
  color = GetNXT2Color(sensorPort);
  switch color
    case 'RED'
      motA = NXTMotor(motorPort, 'Power', defPower, 'SpeedRegulation', false, 'TachoLimit', degreeTurn, 'ActionAtTachoLimit', 'HoldBrake');
      motA.SendToNXT()
      %prida se do vektoru 1
      colorVec(end+1) = 1;
      disp('cervena')
      pause(3);
    case 'GREEN'
      motA = NXTMotor(motorPort, 'Power', defPower, 'SpeedRegulation', false, 'TachoLimit', degreeTurn, 'ActionAtTachoLimit', 'HoldBrake');
      motA.SendToNXT()
      %prida se do vektoru 2
      colorVec(end+1) = 2;
      disp('zelena')
      pause(3);
    case 'BLUE'
      motA = NXTMotor(motorPort, 'Power', defPower, 'SpeedRegulation', false, 'TachoLimit', degreeTurn, 'ActionAtTachoLimit', 'HoldBrake');
      motA.SendToNXT()
      %prida se do vektoru 3
      colorVec(end+1) = 3;
      disp('modra')
      pause(3);
    case 'YELLOW'
      motA = NXTMotor(motorPort, 'Power', defPower, 'SpeedRegulation', false, 'TachoLimit', degreeTurn, 'ActionAtTachoLimit', 'HoldBrake');
      motA.SendToNXT()
      %prida se do vektoru 4
      colorVec(end+1) = 4;
      disp('zluta')
      pause(3);
    otherwise
      pause(3)
  end

end