gap = linspace(0.25, 2.25, 9); %values for the distance in mm.
voltage = [1.50 4.49 7.20 10.49 13.20 16.35 19.05 22.49 25.71]; %values for the voltage.
plot(gap, voltage, "+"); %plots the graph of gap against voltage using + as a marker for the raw data.
%labels and titles the graph on the figure.
xlabel('Gap /mm');
ylabel('Voltage /V');
title('A graph to show how the voltage varies with a gap for a proximity probe');
grid on; 
p = polyfit(gap, voltage, 1); %finds the coefficients of a best fit line.  
hold on; %holds onto the previous graph so that it is not overwritten.
new_y = polyval(p, gap); %finds y on x as a next best fit graph.
plot(gap, new_y); %plots the line of best fit.
%outputs the 2 values for sensitivty and y intercept.
disp("The sensitivty of the probe is " + (p(1)));
disp("The voltage output of the probe at a distance of 0mm is " + p(2));
