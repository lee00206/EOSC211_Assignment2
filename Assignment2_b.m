clear;

%% Inputs
Mm = 3.3*10^23; %in kg
Rm = 2440000; %in m
dt = 60; %in sec
tf = 40*dt; %in sec
sxo = -3050000; %in m
syo = -3*Rm; %in m
so = [sxo,syo];
vo = [0,7000]; %in m/s

%% Making the text file
fid = fopen('syo.txt','w');

%short introduction
fprintf(fid,'This text file shows how the closest appraoch altitude changes with different initial positions in the y-direction.\n\n');
fprintf(fid,'%10s %10s\n','Initial','Closest');
fprintf(fid,'%10s %10s\n','Position','Approach');
fprintf(fid,'%10s %10s\n','in y-dir','Altitude');
fprintf(fid,'%10s %10s\n','(Rm)','(km)');
%first value
[acc, vel, pos] = get_traj(so, vo, dt, tf, Mm, Rm);
ACC = sqrt(acc(:,1).^2+acc(:,2).^2);
VEL = (sqrt(vel(:,1).^2+vel(:,2).^2))./1000;
ALT = (sqrt(pos(:,1).^2+pos(:,2).^2)-Rm)./1000;
closest_alt = min(ALT);
fprintf(fid,'%10s %10.3f\n','-3*Rm',closest_alt);

for i = 1:9
    syo = syo*2;
    tf = tf*2;
    so = [sxo,syo];
    [acc, vel, pos] = get_traj(so, vo, dt, tf, Mm, Rm);
    ACC = sqrt(acc(:,1).^2+acc(:,2).^2);
    VEL = (sqrt(vel(:,1).^2+vel(:,2).^2))./1000;
    ALT = (sqrt(pos(:,1).^2+pos(:,2).^2)-Rm)./1000;
    closest_alt = min(ALT);
    fprintf(fid,'%7.0f*Rm %10.3f\n',syo/Rm,closest_alt);
end
