function [turnDirection] = goTurn(motorLeft, motorRight, speed, turnDirectionInp)
%Tato funkce slouzi k tomu, aby robot otocil svuj smer pohybu.
%Udela se to, ze se robot otoci na jednom kole
  motLeft  = NXTMotor(motorLeft, 'Power',  0); %'TachoLimit', 3, 'ActionAtTachoLimit', 'Brake'); %zastavi motory , 'TachoLimit', 0, 'ActionAtTachoLimit', 'HoldBrake'
  motRight = NXTMotor(motorRight, 'Power', 0);% 'TachoLimit', 3, 'ActionAtTachoLimit', 'Brake'); %zastavi motory

  motLeft.SendToNXT();
  motRight.SendToNXT();
  pause(0.05)
%   degrees = 2160;
    switch turnDirectionInp
      case 0 %doleva
        motLeft  = NXTMotor(motorLeft, 'Power',  -speed/4);
        motRight = NXTMotor(motorRight, 'Power', speed);
        motLeft.SendToNXT();
        motRight.SendToNXT();
        pause(0.38*speed);
        turnDirection = 1;
        motLeft  = NXTMotor(motorLeft, 'Power',  0); %'TachoLimit', 3, 'ActionAtTachoLimit', 'Brake'); %zastavi motory , 'TachoLimit', 0, 'ActionAtTachoLimit', 'HoldBrake'
        motRight = NXTMotor(motorRight, 'Power', 0);% 'TachoLimit', 3, 'ActionAtTachoLimit', 'Brake'); %zastavi motory
        
        motLeft.SendToNXT();
        motRight.SendToNXT();
        pause(0.5);
      case 1 %doprava
        motLeft  = NXTMotor(motorLeft, 'Power',  speed); %'TachoLimit', degrees, 'ActionAtTachoLimit', 'Brake');
        motRight = NXTMotor(motorRight, 'Power', -speed/4); %'TachoLimit', degrees/speed, 'ActionAtTachoLimit', 'Brake');
        motLeft.SendToNXT();
        motRight.SendToNXT();
        pause(0.38*speed);
        turnDirection = 0;
        motLeft  = NXTMotor(motorLeft, 'Power',  0); %'TachoLimit', 3, 'ActionAtTachoLimit', 'Brake'); %zastavi motory , 'TachoLimit', 0, 'ActionAtTachoLimit', 'HoldBrake'
        motRight = NXTMotor(motorRight, 'Power', 0);% 'TachoLimit', 3, 'ActionAtTachoLimit', 'Brake'); %zastavi motory
        
        motLeft.SendToNXT();
        motRight.SendToNXT();
        pause(0.5);
    end
end

