within MasterProject.Models;

model InertialRigid
  Modelica.Mechanics.Rotational.Sources.Torque tau annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia J1 annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia J2 annotation(
    Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(J1.flange_b, J2.flange_a) annotation(
    Line(points = {{10, 0}, {20, 0}, {20, 0}, {20, 0}}));
  connect(tau.flange, J1.flange_a) annotation(
    Line(points = {{-20, 0}, {-10, 0}, {-10, 0}, {-10, 0}}));

end InertialRigid;
