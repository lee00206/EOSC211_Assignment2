clear;

%% Inputs
Mm = 3.3*10^23; %in kg
Rm = 2440000; %in m
Rmm = 2440; %in km
dt = 5; %in sec
tf = 1280*60; %in sec
syo = -96*Rm; %in m
atarget = 195; %in km
atargetm = atarget*1000; %in m
sxo=-(Rm+4*atargetm):atargetm:-(Rm+atargetm); %in m
vyo = 4000:500:8000; %in m/s

%% Calculation

[acc vel pos] = get_traj([sxo(end),syo],[0,vyo(end)], dt, tf, Mm, Rm);

ALT = (sqrt(pos(:,1).^2+pos(:,2).^2)-Rm)./1000;
index = find(ALT<0);
pos1_index = pos(index(1),1);
pos2_index = pos(index(1),2);

pos1km=pos(:,1)./1000;
pos2km=pos(:,2)./1000;

figure(5);
hold on;
circle(0,0,Rmm);
plot(pos1km,pos2km,'ro','Linestyle','none','Markersize',5);
ylim([-9000 9000]);
xlim([-9000 9000]);
txt = ['Crash site position = [' num2str(round(pos1_index)) ',' num2str(round(pos2_index)) ']'];
txt2 = ['The initial conditions: vyo = ' num2str(vyo(end)) ', sxo = ' num2str(sxo(end))];
text(0,0,txt);
text(0,-1000,txt2);
xlabel('x-distance (km)');
ylabel('y-distance (km)');
grid on
axis equal


function circle(x,y,r)
%x and y are the coordinates of the center of the circle
%r is the radius of the circle
ang=0:0.01:2*pi; 
xp=r*cos(ang);
yp=r*sin(ang);
plot(x+xp,y+yp);
end