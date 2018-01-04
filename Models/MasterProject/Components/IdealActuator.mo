within MasterProject.Components;

model IdealActuator
  extends MasterProject.Interfaces.Actuator;
  Modelica.Mechanics.Rotational.Sources.Torque torque1 annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(torque1.support, internalSupport) annotation(
    Line(points = {{0, -10}, {0, -10}, {0, -80}, {0, -80}}));
  connect(torque1.flange, flange) annotation(
    Line(points = {{10, 0}, {100, 0}, {100, 0}, {100, 0}}));
  connect(tau, torque1.tau) annotation(
    Line(points = {{-120, 0}, {-12, 0}, {-12, 0}, {-12, 0}}, color = {0, 0, 127}));
end IdealActuator;