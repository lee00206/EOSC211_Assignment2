function [acc, vel, pos] = get_traj(so, vo, dt, tf, Mp, Rp)
%get_traj return the acceleration, velocity and position
%VECTORS along the complete spacecraft trajectory
%
%Use: get_traj(so, vo, dt, tf, Mp, Rp)
%
%INPUTS:
%so: initial position VECTOR (sxo, syo)
%vo: inital velocity VECTOR (vxo, vyo)
%dt: time increment at which spacecraft acceleration, velocity, positions 
%are updated
%tf: total time
%Mp: mass of planet
%Rp: radius of planet
%
%OUTPUTS:
%3 ARRAYS: vec, vel, pos each of dimensions (number of increments,2)
%where number of increments = 1+(tf/dt)
%1st row gives values in x dir.; while 2nd row gives values in y dir.

%%Checking inputs
checkinit(so, vo, Rp);

%%Initializing
nt = 1+(tf/dt);  %calculates the number of number of increments
acc = NaN(nt,2); %setting up the arrays
vel = NaN(nt,2);
pos = NaN(nt,2);
vel(1,:) = vo;   %getting the inputs
pos(1,:) = so;
acc(1,:) = gravacc(pos(1,:),Mp);

%%Actual calculations
for i = 2:nt
    [ds,dv] = scvelpos(acc(i-1,:),vel(i-1,:),dt);
    pos(i,:) = pos(i-1,:) + ds;             %Updates the position
    vel(i,:) = vel(i-1,:) + dv;             %Updates the velocity
    acc(i,:) = gravacc(pos(i,:),Mp);        %Calculates acceleration
end

