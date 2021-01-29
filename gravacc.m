function A = gravacc(pos,Mp)
%gravacc computes the gravitational acceleration on the spacecraft at any 
%given point along the trajectory.
%
%Use: gravacc(pos,Mp)
%
%INPUTS:
%pos: a position vector (sx,sy) which contains the spacecraft's current
%position at coordinates (sx,sy).
%Mp: mass of the planet that the spacecraft going over
%
%OUTPUTS:
%(ax,ay): a vector of x,y pair of acceleration of the spacecraft due to the
%planet at that time instant at the position specified by the input.
%
%Physics:
%Assume the planet is centered at (0,0), and distance between the center of
%the planet and the spacecraft will be calculated as 's'. It will then be
%used to calculated the acceleration, which is then separated into vectors.

%Useful constants:
G = 6.67*10^-11; %m^3kg^-1s^-2

%Get the distance between spacecraft and the planet
s = sqrt(pos(1)^2 + pos(2)^2);

%Acceleration
a = (G*Mp)/(s^2);

%Breaking down the acceleration into x & y directions
beta = acos(-pos(2)/s);
ax = a*sin(beta);
ay = a*cos(beta);
A = [ax,ay];

end



