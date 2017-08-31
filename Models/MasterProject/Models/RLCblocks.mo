within MasterProject.Models;
model RLCblocks
  Modelica.Blocks.Sources.Sine sine annotation(
    Placement(visible = true, transformation(origin = {-62, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 1 / C)  annotation(
    Placement(visible = true, transformation(origin = {-28, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = R1)  annotation(
    Placement(visible = true, transformation(origin = {30, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1 annotation(
    Placement(visible = true, transformation(origin = {58, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = R2)  annotation(
    Placement(visible = true, transformation(origin = {0, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain4(k = L)  annotation(
    Placement(visible = true, transformation(origin = {30, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product3 annotation(
    Placement(visible = true, transformation(origin = {90, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator2 annotation(
    Placement(visible = true, transformation(origin = {58, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k1 = -1)  annotation(
    Placement(visible = true, transformation(origin = {2, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k2 = -1)  annotation(
    Placement(visible = true, transformation(origin = {-32, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sine.y, add1.u2) annotation(
    Line(points = {{-51, 2}, {-48, 2}, {-48, 8}, {-10, 8}}, color = {0, 0, 127}));
  connect(sine.y, add2.u1) annotation(
    Line(points = {{-51, 2}, {-48, 2}, {-48, -14}, {-44, -14}}, color = {0, 0, 127}));
  connect(gain3.y, product3.u2) annotation(
    Line(points = {{12, -20}, {12, -4}, {78, -4}}, color = {0, 0, 127}));
  connect(integrator1.y, product3.u1) annotation(
    Line(points = {{70, 14}, {72, 14}, {72, 8}, {78, 8}}, color = {0, 0, 127}));
  connect(integrator2.y, add2.u2) annotation(
    Line(points = {{69, -20}, {71, -20}, {71, -36}, {-49, -36}, {-49, -26}, {-45, -26}, {-45, -26}}, color = {0, 0, 127}));
  connect(add2.y, gain3.u) annotation(
    Line(points = {{-21, -20}, {-13, -20}}, color = {0, 0, 127}));
  connect(gain3.y, gain4.u) annotation(
    Line(points = {{11, -20}, {18, -20}}, color = {0, 0, 127}));
  connect(gain4.y, integrator2.u) annotation(
    Line(points = {{41, -20}, {46, -20}}, color = {0, 0, 127}));
  connect(integrator1.y, gain1.u) annotation(
    Line(points = {{70, 14}, {72, 14}, {72, 40}, {-48, 40}, {-48, 24}, {-40, 24}, {-40, 24}}, color = {0, 0, 127}));
  connect(gain2.y, integrator1.u) annotation(
    Line(points = {{41, 14}, {46, 14}}, color = {0, 0, 127}));
  connect(add1.y, gain2.u) annotation(
    Line(points = {{13, 14}, {18, 14}}, color = {0, 0, 127}));
  connect(gain1.y, add1.u1) annotation(
    Line(points = {{-17, 24}, {-13.5, 24}, {-13.5, 20}, {-10, 20}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.2")));
end RLCblocks;
