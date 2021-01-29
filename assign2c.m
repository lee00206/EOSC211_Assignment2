clear;

%% Inputs
Mm = 3.3*10^23; %in kg
Rm = 2440000; %in m
Rmm = 2440; %in km
dt = 60; %in sec
tf = 1280*60; %in sec
sxo = -3050000; %in m
syo = -96*Rm; %in m
so = [sxo,syo];
vo = [0,7000]; %in m/s
atarget = 195; %in km

%% Calculations
[acc, vel, pos] = get_traj(so, vo, dt, tf, Mm, Rm);
ALT = (sqrt(pos(:,1).^2+pos(:,2).^2)-Rm)./1000;
closest_alt = min(ALT);
percentage_error = 100*(closest_alt-atarget)/atarget;
dt_store = dt;
dt1_store = 1/dt;

tic
while percentage_error >= 2
    dt = dt/2;
    dt_store = [dt_store; dt];
    [acc, vel, pos] = get_traj(so, vo, dt, tf, Mm, Rm);
    ALT = (sqrt(pos(:,1).^2+pos(:,2).^2)-Rm)./1000;
    closest_alt = min(ALT);
    percentage_error=[percentage_error; 100*(closest_alt-atarget)/atarget];
    dt1 = 1/dt;
    dt1_store = [dt1_store; dt1];
end
toc
elapsedtime = toc;

%% Plot Figure 3
figure(3);

subplot(2,1,1); %plotting percentage error against 1/dt
plot(dt1_store,percentage_error,'-o','Markersize',5);
title('Percentage Error vs. 1/dt');
ylabel('Percentage Error');
xlabel('1/dt (1/sec)');

subplot(2,1,2); %plotting percentage error against dt
plot(dt_store,percentage_error,'-o','Markersize',5);
title('Percentage Error vs. dt');
xlim([0 60]);
ylabel('Percentage Error');
xlabel('dt (sec)');
set(gca, 'xdir', 'reverse');
txt = {['The final dt needed to reach the 2% error= ' num2str(round(dt(end))) ' sec '],...
      ['and the elapsed time is ' num2str(elapsedtime) ' seconds.']};
text(49,3, txt);


%% Comments on time-stepping

% In order to keep the accuracy while making the code run faster, we need
% to use use a large dt when the spacecraft is far from the planet and use 
% a small dt when it gets closer, because acceleration is not constant over
% large dt near the planet. We can evaluate the timestepping once inside 
% the loop by using if statements: if the distance of the spacecraft is 
% smaller than a certain number, use smaller dt for further calculations.
% However, the tricky point is we have to change the condition every time
% we go through the loop, and we have no idea yet on how to quantify it.