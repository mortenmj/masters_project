within MasterProject.Architectures;
partial model InertialArchitecture
"Inertial model with replaceable blocks"
  import MasterProject.Interfaces.Actuator;
  import MasterProject.Interfaces.Controller;
  import Modelica.Blocks.Interfaces.SignalSource;
  import MasterProject.Interfaces.Sensor;
  import MasterProject.Interfaces.Setpoint;
  import MasterProject.Components.Plant;
  import Modelica.Blocks.Sources.Sine;

  Plant plant annotation(
    Placement(visible = true, transformation(origin = {-8, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  replaceable Setpoint reference annotation(
    Placement(visible = true, transformation(origin = {80, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  replaceable Controller controller annotation(
    Placement(visible = true, transformation(origin = {46, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  replaceable Actuator actuator annotation(
    Placement(visible = true, transformation(origin = {-48, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  replaceable Sensor sensor annotation(
    Placement(visible = true, transformation(origin = {26, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sensor.w, controller.u_m) annotation(
    Line(points = {{38, 0}, {46, 0}, {46, 18}}, color = {0, 0, 127}));
  connect(reference.y, controller.u_s) annotation(
    Line(points = {{70, 30}, {60, 30}, {60, 30}, {58, 30}}, color = {0, 0, 127}));
  connect(controller.y, actuator.tau) annotation(
    Line(points = {{35, 30}, {-79, 30}, {-79, 0}, {-61, 0}}, color = {0, 0, 127}));
  connect(actuator.flange, plant.flange_a) annotation(
    Line(points = {{-38, 0}, {-18, 0}, {-18, 0}, {-18, 0}}));
  connect(plant.flange_b, sensor.flange) annotation(
    Line(points = {{2, 0}, {16, 0}, {16, 0}, {16, 0}}));
  annotation(
    uses(Modelica(version = "3.2.2")));
end InertialArchitecture;
