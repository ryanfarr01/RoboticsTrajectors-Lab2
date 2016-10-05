% GetAllSplines   Gets the trajectories for the uppercut and jab
%  
%	Run - Calculates the trajectories for each of the 7 dimensions for each
%	punch (uppercut and jab) and outputs them as text files. Optionally
%	also plots each of the dimensions.
%  
%	tfinal = last time, which corresponds to the last point in the
%	trajectory
%   tmid = mid time, which corresponds to the middle point in the
%   trajectory points
%   step = time step to be used when calculating trajectories
%   plot_graphs = boolean that plots if true
%  
%	Shane Baca, Devin Taylor, Ryan Baker, Ryan Farr
%	CS 5310/ME 5220 Introduction to Robotics
%	October 4th, 2016

%parameters
tfinal = 3;
tmid = 1.5;
step = 0.02;
plot_graphs = true;

%Output file names
UppercutFile = 'UpperCutSplines.txt';
JabFile = 'JabSplines.txt';
delimiter = ',';


% Data Entry
PointsUppercut = ...
[ -2.75771,-3.0323,-2.75771; ...
    0.879738,1.3127,0.879738;...
    -.203636,-0.859796,-0.203636;...
    0.867466,0.333257,0.867466;...
    -0.5184,0.234699,-0.518486;...
    -0.02646,1.03275,-0.0264612;...
    3.04725,3.04725,3.04725];
disp(PointsUppercut);

PointsJab = ...
    [-1.94854,-2.455352,-1.94854;...
    2.14566,0.576393,2.14566;...
    0.233549,-0.466714,0.233549;...
    1.01856,0.132306,1.01856;...
    0.552617,2.71285,0.552617;...
    0.595568,0.137291,0.595568;...
    3.04687,2.94601,3.04687];
disp(PointsJab);

%Real Code

%time for plots
t = 0:step:tfinal + step;

%Calculate the uppercut trajectory and plot
UpperCutSplines = [];
for i = 1:size(PointsUppercut,1)
    [spline] = makespline(PointsUppercut(i,:),tmid, tfinal,step );
    UpperCutSplines = [UpperCutSplines;spline];
    % These plot the joint angles for the upper cut
    if plot_graphs == true
        if i == 1
            figure
            
            plot(t,spline);
            title('Trajectory in each dimension over time for Uppercut');
            xlabel('Time');
            ylabel('Value');
           hold on 
        else
            plot(t, spline);
        end
    end
end

if plot_graphs
    legend('dimension 1', 'dimension 2', 'dimension 3', 'dimension 4', 'dimension 5', 'dimension 6', 'dimension 7');
    hold off
end

%Calculate the jab trajectories and plot
JabSplines = [];
for i = 1:size(PointsJab,1)
    [spline] = makespline(PointsJab(i,:),tmid, tfinal,step );
    JabSplines = [JabSplines;spline];
    % These plot the joint angles for the jab
    if plot_graphs == true
        if i == 1
            figure
            plot(t,spline);
            title('Trajectory in each dimension over time for Jab');
            xlabel('Time');
            ylabel('Value');
            hold on
        else
            plot(t, spline);
        end
    end
end

if plot_graphs
    legend('dimension 1', 'dimension 2', 'dimension 3', 'dimension 4', 'dimension 5', 'dimension 6', 'dimension 7');
end

%Print to File
dlmwrite(UppercutFile, step);
dlmwrite(JabFile, step);

write_UpperCutSplines = transpose(UpperCutSplines);
write_JabSplines = transpose(JabSplines);
dlmwrite(UppercutFile, write_UpperCutSplines,'-append', 'delimiter', delimiter);
dlmwrite(JabFile,write_JabSplines, '-append','delimiter', delimiter);