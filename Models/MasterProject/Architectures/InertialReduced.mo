within MasterProject.Architectures;
partial model InertialReduced
"Inertial model with replaceable blocks"
  import MasterProject.Interfaces.Actuator;
  import MasterProject.Interfaces.Controller;
  import Modelica.Blocks.Interfaces.SignalSource;
  import MasterProject.Interfaces.Sensor;
  import MasterProject.Interfaces.Setpoint;
  import MasterProject.Components.Process;
  import MasterProject.Components.DummySetpoint;

  Process process annotation(
    Placement(visible = true, transformation(origin = {-8, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  replaceable Actuator actuator annotation(
    Placement(visible = true, transformation(origin = {-48, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  replaceable Sensor sensor annotation(
    Placement(visible = true, transformation(origin = {26, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {-90, 1.77636e-15}, extent = {{-8, -8}, {8, 8}}, rotation = 0), iconTransformation(origin = {-90, 1.77636e-15}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(visible = true, transformation(origin = {66, 0}, extent = {{-8, -8}, {8, 8}}, rotation = 0), iconTransformation(origin = {66, 0}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
equation
  connect(sensor.w, y) annotation(
    Line(points = {{38, 0}, {60, 0}, {60, 0}, {66, 0}}, color = {0, 0, 127}));
  connect(u, actuator.tau) annotation(
    Line(points = {{-90, 0}, {-62, 0}, {-62, 0}, {-60, 0}}, color = {0, 0, 127}));
  connect(actuator.flange, process.flange_a) annotation(
    Line(points = {{-38, 0}, {-18, 0}, {-18, 0}, {-18, 0}}));
  connect(process.flange_b, sensor.flange) annotation(
    Line(points = {{2, 0}, {16, 0}, {16, 0}, {16, 0}}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(initialScale = 0.1)));
end InertialReduced;