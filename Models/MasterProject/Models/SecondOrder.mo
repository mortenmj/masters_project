within MasterProject.Models;
model SecondOrder "x'' + ax' + bx = c"
  parameter Real a=1, b=1, c=1;
  Real x_1, x_2;

initial equation
  x_1 = 2;
  x_2 = 0;
equation
  der(x_1) = x_2;
  der(x_2) = -a*x_2 - b*x_1 + c;
annotation(experiment(StartTime=0,StopTime=20));
end SecondOrder;
