within MasterProject.Architectures;

partial model Inertial "Inertial model with replaceable blocks"
  import MasterProject.Interfaces.Actuator;
  import MasterProject.Interfaces.Controller;
  import Modelica.Blocks.Interfaces.SignalSource;
  import MasterProject.Interfaces.Sensor;
  import MasterProject.Interfaces.Setpoint;
  import MasterProject.Components.Process;
  import Modelica.Blocks.Sources.Sine;
  MasterProject.Components.Process process annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  replaceable MasterProject.Interfaces.Setpoint reference annotation(
    Placement(visible = true, transformation(origin = {80, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  replaceable MasterProject.Interfaces.Controller controller annotation(
    Placement(visible = true, transformation(origin = {46, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  replaceable MasterProject.Interfaces.Actuator actuator annotation(
    Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  replaceable MasterProject.Interfaces.Sensor sensor annotation(
    Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(process.flange_b, sensor.flange) annotation(
    Line(points = {{-20, 0}, {16, 0}}));
  connect(sensor.w, controller.u_m) annotation(
    Line(points = {{38, 0}, {46, 0}, {46, 18}}, color = {0, 0, 127}));
  connect(reference.y, controller.u_s) annotation(
    Line(points = {{70, 30}, {60, 30}, {60, 30}, {58, 30}}, color = {0, 0, 127}));
  connect(controller.y, actuator.tau) annotation(
    Line(points = {{35, 30}, {-93, 30}, {-93, 0}, {-82, 0}}, color = {0, 0, 127}));
  connect(actuator.flange, process.flange_a) annotation(
    Line(points = {{-60, 0}, {-38, 0}}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(graphics = {Rectangle(origin = {-14, 18}, extent = {{-86, 30}, {42, -34}}), Text(origin = {-43, 43}, extent = {{-29, 5}, {29, -5}}, textString = "Plant")}, coordinateSystem(initialScale = 0.1)));
end Inertial;