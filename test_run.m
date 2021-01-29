Mm = 3.3*10^23; %in kg
Rm = 2440000; %in m
tf = 40*60; %in sec
dt = 60; %in sec
sxo = -3050000; %in m
syo = -3*Rm; %in m
vo = [0,7000]; %in m/s

so = [sxo,syo];
Rmm = Rm/1000;

[acc, vel, pos] = get_traj(so, vo, dt, tf, Mm, Rm);

pos1km=pos(:,1)./1000;
pos2km=pos(:,2)./1000;

figure(1);
hold on;
circle(0,0,Rmm);
plot(pos1km,pos2km,'ro','Linestyle','none','Markersize',5);
ylim([-9000 9000]);
xlim([-9000 9000]);
grid on
axis equal

dtm = dt/60; %in min
tfm = tf/60; %in min

a = sqrt(acc(:,1).^2+acc(:,2).^2);
velocity = (sqrt(vel(:,1).^2+vel(:,2).^2))./1000;

alt = (sqrt(pos(:,1).^2+pos(:,2).^2)-Rm)./1000;
closest_alt = min(alt);
calt = round(closest_alt);

figure(2);

subplot(3,1,1);
hold on;
plot(0:dtm:tfm, acc(:,1),'r-o','Markersize',1);
plot(0:dtm:tfm, acc(:,2),'g-o','Markersize',1);
plot(0:dtm:tfm, a, 'b-o','Markersize',1);
title('Acceleration due to Gravitational Force');
ylabel('Acceleration (m/s^2)');
legend('ax','ay','|a|');
grid on

subplot(3,1,2);
plot(0:dtm:tfm, velocity, 'k-o','Markersize',1);
ylim([6.5 8]);
title('Spacecraft speed');
ylabel('v (km/s)');
grid on

subplot(3,1,3);
plot(0:dtm:tfm, alt, 'g-o','Markersize',1);
set(gca, 'YScale','log');
ylim([100 10000]);
txt = ['Closest approach alt= ' num2str(calt) ' km'];
text(21,500,txt);
title('Spacecraft Altitude');
ylabel('Altitude (km)');
xlabel('Time (mins)');
grid on

function circle(x,y,r)
%x and y are the coordinates of the center of the circle
%r is the radius of the circle
ang=0:0.01:2*pi; 
xp=r*cos(ang);
yp=r*sin(ang);
plot(x+xp,y+yp);
end