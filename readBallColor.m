function colorVec = readBallColor(sensorPort,motorPort,colorVec)
  color = GetNXT2Color(sensorPort);
  motA= NXTMotor(motorPort, 'Power',  0);
  switch color
    case 'RED'
      motA.TachoLimit(90)
      motA.SendToNXT()
      %prida se do vektoru 1
      colorVec(end+1) = 1;
    case 'GREEN'
      motA.TachoLimit(90)
      motA.SendToNXT()
      %prida se do vektoru 2
      colorVec(end+1) = 2;
    case 'BLUE'
      motA.TachoLimit(90)
      motA.SendToNXT()
      %prida se do vektoru 3
      colorVec(end+1) = 3;
    case 'YELLOW'
      motA.TachoLimit(90)
      motA.SendToNXT()
      %prida se do vektoru 4
      colorVec(end+1) = 4;
  end
  
  pause(1);
end