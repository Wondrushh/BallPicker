function colorVec = readBallColor(sensorPort,colorVec)
  color = GetNXT2Color(sensorPort);
  
  switch color
    case 'RED'
      %otoci se motor pasu - dopsat
      %prida se do vektoru 1
      colorVec(end+1) = 1;
    case 'GREEN'
      %otoci se motor pasu - dopsat
      %prida se do vektoru 2
      colorVec(end+1) = 2;
    case 'BLUE'
      %otoci se motor pasu - dopsat
      %prida se do vektoru 3
      colorVec(end+1) = 3;
    case 'YELLOW'
      %otoci se motor pasu - dopsat
      %prida se do vektoru 4
      colorVec(end+1) = 4;
  end
  
  pause(1);
end