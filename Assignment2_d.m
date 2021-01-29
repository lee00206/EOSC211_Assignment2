clear;

%% Inputs
Mm = 3.3*10^23; %in kg
Rm = 2440000; %in m
Rmm = 2440; %in km
dt = 5; %in sec
tf = 1280*60; %in sec
syo = -96*Rm; %in m
% vo = [4000:500:8000]; %in m/s
atarget = 195; %in km
atargetm = atarget*1000; %in m

%% Calculation
sxo = -(Rm+4*atargetm):atargetm:-(Rm+atargetm); %in m
vyo = 4000:500:8000; %in m/s

for i = 1:length(sxo)
    for j = 1:length(vyo)
        [acc,vel,pos] = get_traj([sxo(i),syo],[0,vyo(j)], dt, tf, Mm, Rm);
        ALT = (sqrt(pos(:,1).^2+pos(:,2).^2)-Rm)./1000;
        closest_alt(j,i) = min(ALT);
    end
end

hold on
contour(sxo,vyo,closest_alt,[0:500]);
contour(sxo,vyo,closest_alt,[0:50:500],'k','ShowText','on');
contour(sxo,vyo,closest_alt,[atarget-5,atarget+5],'r-','Linewidth',2);
xlabel('Initial x position (m)');
ylabel('Initial velocity in y direction (m/s)');
title('contour map of initial x-position and initial y-velocity');
