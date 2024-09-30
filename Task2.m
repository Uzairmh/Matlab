Pc = 76.40773718;
ConstantKb = 190000000;
E = 200e9;
ab = 169e-3;
ConstantKa = 352e6;
Di = 18e-3;
De = 45e-3;
I_04 = (pi*(De^4 - Di^4))/64;
L = linspace(0.1, 0.25, 150); %array
Dtotal = zeros(1, 150);

%
for i = 1:150
    x = ab + L(i);
    Dbear = ((L(i) + ab)/L(i)) * (((ab)*Pc)/(L(i)*ConstantKb) + (((L(i) + ab) * Pc)/(L(i) * ConstantKa))) - ((ab) * Pc)/(L(i)*ConstantKb);
    Dbend = (-Pc/(6*E*I_04)) * ((-((ab)/L(i))* x^3) + (1 + ab/L(i)) * (x - L(i))^3 + ((ab)*L(i) * x));
    Dtotal(i) = Dbear + Dbend;
end

plot(L, Dtotal);
grid on
hold on

for i = 1:150
    x = ab + L(i);
    Dbear = ((L(i) + ab)/L(i)) * (((ab)*Pc)/(L(i)*ConstantKb) + (((L(i) + ab) * Pc)/(L(i) * ConstantKa))) - ((ab) * Pc)/(L(i)*ConstantKb);
    Dbend = (-Pc/(6*E*I_04)) * ((-((ab)/L(i))* x^3) + (1 + ab/L(i)) * (x - L(i))^3 + ((ab)*L(i) * x));
    Dtotal(i) = Dbear + Dbend;
end

plot(L, Dtotal);
grid on
hold on





