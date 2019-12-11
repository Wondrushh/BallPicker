function goBack(motorLeft, motorRight, speed)
%goStraight Robot jede rovne.
%   Robot jede rovne. motorLeft = dira pro levy motor, motorRight = dira...
%   pro pravy motor, speed = rychlost motoru

motLeft = NXTMotor(motorLeft, 'Power',  -speed);
motRight = NXTMotor(motorRight, 'Power', -speed);

motLeft.SendToNXT();
motRight.SendToNXT();

pause(0.05)

end

