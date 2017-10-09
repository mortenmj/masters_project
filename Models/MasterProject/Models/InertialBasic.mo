within MasterProject.Models;

model InertialBasic
  Modelica.Mechanics.Rotational.Components.SpringDamper springDamper1(c = 11.0, d = 0.2, phi_rel(displayUnit = "rad"), phi_rel0(displayUnit = "rad")) annotation(
    Placement(visible = true, transformation(origin = {14, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 0.4, phi(displayUnit = "rad", fixed = true, start = 0), w(start = 0)) annotation(
    Placement(visible = true, transformation(origin = {-16, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.SpringDamper springDamper2(c = 5.0, d = 1.0)  annotation(
    Placement(visible = true, transformation(origin = {68, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia2(J = 1.0, phi(displayUnit = "rad", fixed = true, start = 0)) annotation(
    Placement(visible = true, transformation(origin = {42, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed1 annotation(
    Placement(visible = true, transformation(origin = {84, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Sources.TorqueStep torqueStep1(startTime = 0, stepTorque = 1)  annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(torqueStep1.flange, inertia1.flange_a) annotation(
    Line(points = {{-40, 0}, {-26, 0}, {-26, 0}, {-26, 0}}));
  connect(springDamper2.flange_b, fixed1.flange) annotation(
    Line(points = {{78, 0}, {84, 0}}));
  connect(inertia2.flange_b, springDamper2.flange_a) annotation(
    Line(points = {{52, 0}, {58, 0}}));
  connect(springDamper1.flange_b, inertia2.flange_a) annotation(
    Line(points = {{24, 0}, {30, 0}}));
  connect(inertia1.flange_b, springDamper1.flange_a) annotation(
    Line(points = {{-6, 0}, {6, 0}}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram);
end InertialBasic;