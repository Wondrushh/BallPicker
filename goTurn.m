function [turnDirection] = goTurn(motorLeft, motorRight, speed, turnDirectionInp)
%Tato funkce slouzi k tomu, aby robot otocil svuj smer pohybu.
%Udela se to, ze se robot otoci na jednom kole
  motLeft  = NXTMotor(motorLeft, 'Power',  5, 'TachoLimit', 5, 'ActionAtTachoLimit', 'Brake'); %zastavi motory , 'TachoLimit', 0, 'ActionAtTachoLimit', 'HoldBrake'
  motRight = NXTMotor(motorRight, 'Power', 5, 'TachoLimit', 5, 'ActionAtTachoLimit', 'Brake'); %zastavi motory

  motLeft.SendToNXT();
  motRight.SendToNXT();
  
    switch turnDirectionInp
      case 0 %doleva
        motLeft  = NXTMotor(motorLeft, 'Power',  5, 'TachoLimit', 0, 'ActionAtTachoLimit', 'Brake');
        motRight = NXTMotor(motorRight, 'Power', speed, 'TachoLimit', 2160, 'ActionAtTachoLimit', 'Brake');
        motLeft.SendToNXT();
        motRight.SendToNXT();
        turnDirection = 1;
      case 1 %doprava
        motLeft  = NXTMotor(motorLeft, 'Power',  speed, 'TachoLimit', 2160, 'ActionAtTachoLimit', 'Brake');
        motRight = NXTMotor(motorRight, 'Power', 5, 'TachoLimit', 0, 'ActionAtTachoLimit', 'Brake');
        motLeft.SendToNXT();
        motRight.SendToNXT();
        turnDirection = 0;
    end
end

