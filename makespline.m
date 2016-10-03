function [spline] = makespline (Points, tfinal,step)
% tfinal =2;
% Points = [-2.75771,-3.0323,-2.75771];
% step = 0.1;


%code for t = 0 to mid point
tmid = tfinal/2;
x0 = Points(1);
x1 = Points(2);
x2 = Points(3);

a0 = x0;
a1 = 0;
a2 = 3*(x1 - x0)/(tmid^2);
a3 = 2*(x0 - x1)/(tmid^3);

t1 = 0:step:tmid;
y1 = zeros(1,size(t1,2));
for i = 1:size(t1,2)
    y1(i) =  a0 + a1*t1(i) + a2*t1(i)^2 +a3*t1(i)^3;
end

% plot(t1,y1);

% code for midpoint to final t
b0 = x1;
b1 = 0;
b2 = 3*(x2-x1)/((tfinal-tmid)^2);
b3 = 2*(x1-x2)/((tfinal-tmid)^3);

t2 = tmid:step:tfinal;
y2 = zeros(1,size(t2,2));
for i = 1:size(t2,2)
    y2(i) =  b0 + b1*(t2(i)-tmid) + b2*(t2(i)-tmid)^2 +b3*(t2(i)-tmid)^3;
end

% plot(t2,y2);

spline = [y1,y2];
t = [t1,t2];
% plot(t,spline);


end