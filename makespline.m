% makespline   Creates a trajectory based on two 3-degree polynomials
%  
%	[spline] = makespline(Points, tfinal, step) Outputs a matrix that
%	represents the values in a given dimension over time. The matrix is
%	created by using two 3-degree polynomials that guarantee the start,
%	mid, and final positions.
%  
%	Points = array storing the initial, mid, and final positions,
%	respectively
%	tmid = the time corresponding to the mid position given in Points
%	tfinal = the time corresponding to the final position given in Points
%   step = the timestep to use for the output trajectory
%  
%	Shane Baca, Devin Taylor, Ryan Baker, Ryan Farr
%	CS 5310/ME 5220 Introduction to Robotics
%	October 4th, 2016

function [spline] = makespline (Points, tmid, tfinal, step)

% Start, mid, and end positions
x0 = Points(1);
x1 = Points(2);
x2 = Points(3);

% Calculate constants for x_1(t)
a0 = x0;
a1 = 0;
a2 = 3*(x1 - x0)/(tmid^2);
a3 = 2*(x0 - x1)/(tmid^3);

% Calculate positions for t = 0 : tmid
t1 = 0:step:tmid;
y1 = zeros(1,size(t1,2));
for i = 1:size(t1,2)
    y1(i) =  a0 + a1*t1(i) + a2*t1(i)^2 +a3*t1(i)^3;
end

% plot(t1,y1);

% Calculate constants for x_2(t)
b0 = x1;
b1 = 0;
b2 = 3*(x2-x1)/((tfinal-tmid)^2);
b3 = 2*(x1-x2)/((tfinal-tmid)^3);

% Calculate positions for t = tmid : tfinal
t2 = tmid:step:tfinal;
y2 = zeros(1,size(t2,2));
for i = 1:size(t2,2)
    y2(i) =  b0 + b1*(t2(i)-tmid) + b2*(t2(i)-tmid)^2 +b3*(t2(i)-tmid)^3;
end

% Return the trajectory
spline = [y1,y2];

end
