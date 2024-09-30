
%clears the command window
clear 

%Requests user input for each of the respective attributes needed
L = input("Enter the length of the beam AB (m):"); 
W = input("Enter the Weight per Unit Length of the beam:");
n = input("Enter the number of loads in the question:");

%Creates an array of zeros for the Weights and Distances of Each weight as well as the .
Weights = zeros(1, n); 
Distances = zeros(1, n);
MX = zeros(1, 1000);

%A for loop that adds each value for weights and distances into an array
for m = 1:n 
    Weights(m) = input(['Enter the load (N) of load ', num2str(m), ': ']);
    Distances(m) = input(['Enter the distance (m) from A of the load ', num2str(m), ': ']);

    %Checks if the distance given for the load is greater than the length.
    while Distances(m) > L 
        Distances(m) = input(['Error: distance entered too large! Re-enter the distance (m) from A of the load ', num2str(m), ': ']);
    end
end 

%Generates 1000 evenly spaced points between 0 and L 
dx = linspace(1, L, 1000);

%This for loop iterates between 1000 different distances and then creates an array for total bending moments using the given formulas
for x = 1:1000
    MX(x) = 0.5*W*dx(x)*(L - dx(x));
    for i = 1:n
        if dx(x) <= Distances(i) %Checks if the distance "x" is less than or equal to the distance at which the considered weight is.
            MX(x) = MX(x)+Weights(i)*(1-(Distances(i)/L))*dx(x);
        else %Once the distance is greater than the weight, this line of code runs.
            MX(x) = MX(x)+(Weights(i)*((1-(Distances(i)/L))*dx(x))-(Weights(i)*(dx(x)-Distances(i))));
        end
    end
end

%This set of code plots the graph and labels the axis accordingly.
plot(dx, MX);
xlabel("Distance in from A /m");
ylabel("Bending moment of the Beam /Nm");
title("A graph to show how the bending moment of a beam varies with distance");








        
        

    
    


