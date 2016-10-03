tfinal = 2;
step = 0.01;

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

UpperCutSplines = [];
for i = 1:size(PointsUppercut,1)
    [spline] = makespline(PointsUppercut(i,:),tfinal,step );
    UpperCutSplines = [UpperCutSplines;spline];
end


JabSplines = [];
for i = 1:size(PointsJab,1)
    [spline] = makespline(PointsJab(i,:),tfinal,step );
    JabSplines = [JabSplines;spline];
end

%Print to File
dlmwrite(UppercutFile, step);
dlmwrite(JabFile, step);

write_UpperCutSplines = transpose(UpperCutSplines);
write_JabSplines = transpose(JabSplines);
dlmwrite(UppercutFile, write_UpperCutSplines,'-append', 'delimiter', delimiter);
dlmwrite(JabFile,write_JabSplines, '-append','delimiter', delimiter);
