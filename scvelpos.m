function [ds,dv] = scvelpos(a,v,dt)
%scvelpos computes the instantaneous change in position and velocity.
%
%INPUTS:
%a: acceleration(from LAST position)
%v: velocity(from LAST position)
%dt: time increment
%
%OUTPUTS:
%ds: instantaneous change in position
%dv: instantaneous change in velocity
%
%***NOTE:
%The dimensions of a,v,ds,dv are 1x2: [x-value,y-value]
%
%Physics: (Equations applied in both x and y directions)
%dv = a*dt, assuming acc = const within dt
%ds = v*dt + (1/2)*a*(dt^2)

for i = [1,2]  %indexing, 1 denotes x direction while 2 denotes y direction
    dv(i) = a(i)*dt; %Calculates dv from last a
    ds(i) = (v(i))*dt + 0.5*a(i)*(dt^2); %Calculates ds
end