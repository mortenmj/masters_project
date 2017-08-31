within MasterProject.Models;
model InertialBasic
  Modelica.Mechanics.Rotational.Components.Inertia inertia2(J = 1.0, phi(displayUnit = "rad",fixed = true, start = 1), w(fixed = true, start = 0))  annotation(
    Placement(visible = true, transformation(origin = {2, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.SpringDamper springDamper2(c = 5.0, d = 1.0, phi_rel(displayUnit = "rad"), phi_rel0(displayUnit = "rad"))  annotation(
    Placement(visible = true, transformation(origin = {28, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed1 annotation(
    Placement(visible = true, transformation(origin = {44, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Components.SpringDamper springDamper1(c = 11.0, d = 0.2, phi_rel(displayUnit = "rad"), phi_rel0(displayUnit = "rad"))  annotation(
    Placement(visible = true, transformation(origin = {-24, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 0.4, phi(displayUnit = "rad", fixed = true, start = 0), w(fixed = true, start = 0))  annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(springDamper2.flange_b, fixed1.flange) annotation(
    Line(points = {{38, 0}, {44, 0}}));
  connect(inertia1.flange_b, springDamper1.flange_a) annotation(
    Line(points = {{-40, 0}, {-34, 0}}));
  connect(springDamper1.flange_b, inertia2.flange_a) annotation(
    Line(points = {{-14, 0}, {-8, 0}}));
  connect(inertia2.flange_b, springDamper2.flange_a) annotation(
    Line(points = {{12, 0}, {18, 0}}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram);
end InertialBasic;
