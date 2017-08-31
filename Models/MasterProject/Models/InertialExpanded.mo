within MasterProject.Models;
model InertialExpanded
  Modelica.Mechanics.Rotational.Components.Inertia inertia2(J = 1, phi(displayUnit = "rad",fixed = true, start = 1), w(fixed = true, start = 0))  annotation(
    Placement(visible = true, transformation(origin = {30, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.SpringDamper springDamper2(c = 5, d = 1, phi_rel(displayUnit = "rad"), phi_rel0(displayUnit = "rad"))  annotation(
    Placement(visible = true, transformation(origin = {30, -44}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.SpringDamper springDamper1(c = 11, d = 0.2, phi_rel(displayUnit = "rad"), phi_rel0(displayUnit = "rad"))  annotation(
    Placement(visible = true, transformation(origin = {0, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 0.4, phi(displayUnit = "rad", fixed = true, start = 0), w(fixed = true, start = 0))  annotation(
    Placement(visible = true, transformation(origin = {-30, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed1 annotation(
    Placement(visible = true, transformation(origin = {0, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torque1 annotation(
    Placement(visible = true, transformation(origin = {-60, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation(
    Placement(visible = true, transformation(origin = {46, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Sine sine1 annotation(
    Placement(visible = true, transformation(origin = {80, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(visible = true, transformation(origin = {46, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.PID PID annotation(
    Placement(visible = true, transformation(origin = {0, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(springDamper2.flange_b, fixed1.flange) annotation(
    Line(points = {{20, -44}, {0, -44}, {0, -44}, {0, -44}}));
  connect(springDamper2.flange_a, inertia2.flange_b) annotation(
    Line(points = {{40, -44}, {46, -44}, {46, -18}, {40, -18}, {40, -18}}));
  connect(feedback1.y, PID.u) annotation(
    Line(points = {{37, 40}, {12, 40}}, color = {0, 0, 127}));
  connect(torque1.tau, PID.y) annotation(
    Line(points = {{-72, -18}, {-80, -18}, {-80, 40}, {-11, 40}}, color = {0, 0, 127}));
  connect(speedSensor1.w, feedback1.u2) annotation(
    Line(points = {{46, 25}, {46, 32}}, color = {0, 0, 127}));
  connect(sine1.y, feedback1.u1) annotation(
    Line(points = {{70, 40}, {56, 40}, {56, 40}, {54, 40}}, color = {0, 0, 127}));
  connect(speedSensor1.flange, inertia2.flange_b) annotation(
    Line(points = {{46, 4}, {46, 4}, {46, -18}, {40, -18}, {40, -18}}));
  connect(fixed1.flange, torque1.support) annotation(
    Line(points = {{0, -44}, {-60, -44}, {-60, -28}}));
  connect(torque1.flange, inertia1.flange_a) annotation(
    Line(points = {{-50, -18}, {-40, -18}}));
  connect(inertia1.flange_b, springDamper1.flange_a) annotation(
    Line(points = {{-20, -18}, {-10, -18}}));
  connect(springDamper1.flange_b, inertia2.flange_a) annotation(
    Line(points = {{10, -18}, {20, -18}}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram);
end InertialExpanded;
