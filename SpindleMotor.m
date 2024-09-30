clear
clc
Vc = 75;
r = 20;
Fc = 64.84;
SpindleRPM = (Vc * 1000)/(2 * pi * r);
SpindlePower = Fc * (Vc/60); % 81.05W
disp(SpindlePower);
MotorPower = SpindlePower; %efficiency??

NumberOfTeethSmall = [10, 11, 12, 14, 15, 16, 18, 19, 20, 21, 22, 24, 25, 26, 28, 30, 32, 34, 36, 38, 40, 42, 44, 46, 48, 50, 60, 72];
NumberOfTeethLarge = [10, 11, 12, 14, 15, 16, 18, 19, 20, 21, 22, 24, 25, 26, 28, 30, 32, 34, 36, 38, 40, 42, 44, 46, 48, 50, 60, 72];
SpeedRatios = [];
for i = 1:length(NumberOfTeethLarge)
    large = NumberOfTeethLarge(i);
    for j = 1:length(NumberOfTeethSmall)
        ratio = NumberOfTeethLarge(i)/NumberOfTeethSmall(j);
        if ratio >= 1.5 && ratio <= 3.1
            SpeedRatios(end + 1) = ratio; %grabs all the ratios
        else 
            continue
        end
    end
end

SmallRPM = zeros(length(SpeedRatios), 1);
TorqueSmall = zeros(length(SpeedRatios), 1);
MechanicalPowers = zeros(length(SpeedRatios), 1);

SpeedRatios = sort(SpeedRatios, 'descend');

TorqueBig = Fc * r;
for n = 1:length(SpeedRatios)
    SmallRPM(n) = SpeedRatios(n) * SpindleRPM;
    TorqueSmall(n) = ((TorqueBig * SpindleRPM)/SmallRPM(n));
    MechanicalPowers(n) = SmallRPM(n) * TorqueSmall(n)/1000;
end

plot(TorqueSmall, SmallRPM); %
xlabel("Torque in mNm");
ylabel("Speed in RPM");
title("Graph to show nominal values of 200W motors and 150W motors against the possible speed ratios")

Kr = 1.4;
Ko = 0.3;
Ks = Kr + Ko; 
DesignPower = SpindlePower * Ks;
disp(DesignPower);

NominalSpeeds150 = [6920, 7580, 5560, 6420, 7590, 3330, 1420, 2690, 1720, 2130];
NominalTorques150 = [94.9, 177, 180, 186, 187, 189, 190, 190, 192, 192];
NominalSpeeds200 = [5680, 5420, 4620, 2470, 5690, 5430, 4630, 2480];
NominalTorques200 = [385, 400, 404, 405, 418, 420, 442, 452];

hold on;
scatter(NominalTorques150, NominalSpeeds150, "Marker", 'x');
hold on;
scatter(NominalTorques200, NominalSpeeds200, "Marker", 'x');

legend('Torque-Speed ratio curve for motors', 'Nominal values 150', 'Nominal values 200');


