function [radius, angle] = cart2polar(x_coord, y_coord, angle_type)
%Converts cartesian coordinates (x_coord, y_coord) to polar coordinates (radius, angle)
%angle_type is a string variable.
%angle_type = 'R' if the angle is in radians.
%angle_type = 'D' if the angle is in degrees.
%x_coord is a float variable of the x co-ordinate.
%y_coord is a float variable of the y co-ordinate.
%By Muhammad Ali Arif 2022 Student I.D = 11006417
if angle_type == 'R'
    angle = atan2(y_coord, x_coord);
elseif angle_type == 'D'
    angle = atan2d(y_coord, x_coord);
else
    disp("Error: Incorrect input for whether you want the angle to be in radians or degrees. Please type either 'R' or 'D'");
end
radius = sqrt((x_coord)^2 + (y_coord)^2);

