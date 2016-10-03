clear
clc
clf
close all

t = 0:0.01:2;
%for i = 1:length(t)
%    x(i) = -3.0323 + 0.82377*t(i)^2 - 0.54918*t(i)^3;
%end
for i = 1:length(t)/2;
   x(i) = -2.75771 - 0.82377*t(i)^2 + 0.54918*t(i)^3;
end
for j = i:length(t)
  x(j) = -3.0323 + 0.82377*(t(j)-t(i))^2 - 0.54918*(t(j)-t(i))^3;
end
plot(t,x)
