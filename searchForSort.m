function [startSorting,turnOut] = searchForSort(sensorPort)
%Robot jezdi a hleda cervenou, jakmile ji najde, zmeni promennou ktera
%tento stav sleduje na 1
%   Robot cte zemi pomoci color senzoru, jakmile najde modrou nebo cernou,
%   otoci se, kdyz najde cervenou, prepise se promenna, která spousti
%   sortujici mechanizmus

color = GetNXT2Color(sensorPort);

  switch color
    case 'RED'
      startSorting = 1;
      pause(0.05);
      turnOut = 0;
    case 'BLACK'
      startSorting = 0;
      turnOut = 1;
      pause(0.05);
    case 'BLUE'
      startSorting = 0;
      turnOut = 1;
      pause(0.05);
    otherwise
      startSorting = 0;
      turnOut = 0;
      pause(0.05);
  end
end

