L = input("Enter the total length of the beam in m: ");
S = input("Enter the distance between support A and support B (the span distance) in m: ");
W = input("Enter the weight per unit length in : ");
D = input("Enter the flexural rigidity of the beam: ");
n = input("Enter the number of loads on the beam: "); %Allows for user input on all of the preceeding values.

x = linspace(0, L, 1000);
Weights = zeros(1, n);
Distances = zeros(1,n);
Deflections = zeros(1, 1000);

for i = 1:n
    Weights(i) = input(['Enter the value of Weight ', num2str(i), ': ']);
    Distances(i) = input(['Enter the distance of Weight ', num2str(i), ' from support A: ']);
    while Distances(i) > S
        Distances(i) = input('Error distance entered is larger than AB, please re-enter :');
    end
end    

for m = 1:1000
    if x(m) <= S
        Deflections(m) = (W/(24*D)) * (-(x(m))^4+(2*x(m)^3)*(2*L-L^2/S) + x(m)*((2*L^2*S) - (4*L*S^2)+(S^3)));
    else
        Deflections(m) = (W/(24*D))*((-3*S^3) + (8*L*S^2) - (4*L^2*S))*(x(m) - S);
    end
    for k = 1:n
        if x(m) <= Distances(k)
            q = S- Distances(k);
            Deflections(m) = Deflections(m) + (Weights(k)*q)/(6*D*S) * ((x(m)^3) - x(m)*(S^2 - q^2));
        elseif x(m) > Distances(k) && x(m) <= S
            q = S - Distances(k);
            Deflections(m) = Deflections(m) + ((Weights(k)*q)/(6*D*S)) * ((x(m)^3) - ((S/q))*((x(m) - Distances(k))^3) - (x(m)*(S^2 - q^2)));
        else
            q = S - Distances(k);
            Deflections(m) = Deflections(m) + ((Weights(k)*q)/(6*D*S)) * ((3*S^2) - (3*S/q)*(S - Distances(k))^2-((S^2 - q^2))) * (x(m) - S);
        end
    end
end

plot(x, Deflections);
    


