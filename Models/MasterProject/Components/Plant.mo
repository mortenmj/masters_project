within MasterProject.Components;

model Plant
  extends Modelica.Blocks.Icons.Block;
  extends Modelica.Mechanics.Rotational.Interfaces.PartialTwoFlangesAndSupport;
  import SI = Modelica.SIunits;
  
  parameter SI.Inertia J1 = 0.4, J2 = 1.0;
  parameter SI.RotationalSpringConstant c1 = 11, c2 = 5;
  parameter SI.RotationalDampingConstant d1 = 0.2, d2 = 1.0;

protected
  Modelica.Mechanics.Rotational.Components.Damper damper1(d = 4) annotation(
    Placement(visible = true, transformation(origin = {34, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Mechanics.Rotational.Components.Inertia inertia2(J = 0.3, phi(displayUnit = "rad", fixed = true, start = 0), w(fixed = true, start = 0)) annotation(
    Placement(visible = true, transformation(origin = {16, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.SpringDamper springDamper1(c = 100, d = 3, phi_rel(displayUnit = "rad"), phi_rel0(displayUnit = "rad")) annotation(
    Placement(visible = true, transformation(origin = {-14, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 0.1, phi(displayUnit = "rad", fixed = true, start = 0), w(fixed = true, start = 0)) annotation(
    Placement(visible = true, transformation(origin = {-44, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  connect(inertia2.flange_b, damper1.flange_b) annotation(
    Line(points = {{40, 0}, {60, 0}, {60, -34}, {44, -34}}));
  connect(springDamper1.flange_b, inertia2.flange_a) annotation(
    Line(points = {{0, 0}, {20, 0}}));
  connect(flange_b, inertia2.flange_b) annotation(
    Line(points = {{100, 0}, {40, 0}}));
  connect(inertia1.flange_b, springDamper1.flange_a) annotation(
    Line(points = {{-40, 0}, {-20, 0}}));
  connect(flange_a, inertia1.flange_a) annotation(
    Line(points = {{-100, 0}, {-60, 0}}));
  connect(damper1.flange_a, internalSupport) annotation(
    Line(points = {{24, -34}, {0, -34}, {0, -80}, {0, -80}}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(initialScale = 0.75)),
    Icon(coordinateSystem(initialScale = 0.75)),
    __OpenModelica_commandLineOptions = "");
end Plant;
