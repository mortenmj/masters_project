within MasterProject.Models;
model RLCblock
  Modelica.Blocks.Sources.Sine sine annotation(
    Placement(visible = true, transformation(origin = {-40, 6}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 1 / C)  annotation(
    Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = R1)  annotation(
    Placement(visible = true, transformation(origin = {22, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1 annotation(
    Placement(visible = true, transformation(origin = {52, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = R2)  annotation(
    Placement(visible = true, transformation(origin = {0, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain4(k = L)  annotation(
    Placement(visible = true, transformation(origin = {30, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product3 annotation(
    Placement(visible = true, transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator2 annotation(
    Placement(visible = true, transformation(origin = {58, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k1 = -1)  annotation(
    Placement(visible = true, transformation(origin = {-8, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k2 = -1)  annotation(
    Placement(visible = true, transformation(origin = {-32, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(integrator2.y, add2.u2) annotation(
    Line(points = {{70, -26}, {72, -26}, {72, -44}, {-56, -44}, {-56, -32}, {-44, -32}, {-44, -32}}, color = {0, 0, 127}));
  connect(gain4.y, integrator2.u) annotation(
    Line(points = {{41, -26}, {46, -26}}, color = {0, 0, 127}));
  connect(integrator1.y, gain1.u) annotation(
    Line(points = {{64, 30}, {72, 30}, {72, 56}, {-56, 56}, {-56, 40}, {-52, 40}, {-52, 40}}, color = {0, 0, 127}));
  connect(integrator1.y, product3.u1) annotation(
    Line(points = {{64, 30}, {72, 30}, {72, 6}, {78, 6}, {78, 6}}, color = {0, 0, 127}));
  connect(gain2.y, integrator1.u) annotation(
    Line(points = {{33, 30}, {40, 30}}, color = {0, 0, 127}));
  connect(add1.y, gain2.u) annotation(
    Line(points = {{3, 30}, {10, 30}}, color = {0, 0, 127}));
  connect(gain1.y, add1.u1) annotation(
    Line(points = {{-28, 40}, {-26, 40}, {-26, 36}, {-20, 36}}, color = {0, 0, 127}));
  connect(sine.y, add1.u2) annotation(
    Line(points = {{-51, 6}, {-56, 6}, {-56, 24}, {-20, 24}}, color = {0, 0, 127}));
  connect(product3.u2, gain3.y) annotation(
    Line(points = {{78, -6}, {14, -6}, {14, -26}, {12, -26}}, color = {0, 0, 127}));
  connect(sine.y, add2.u1) annotation(
    Line(points = {{-51, 6}, {-56, 6}, {-56, -20}, {-44, -20}}, color = {0, 0, 127}));
  connect(add2.y, gain3.u) annotation(
    Line(points = {{-21, -26}, {-13, -26}}, color = {0, 0, 127}));
  connect(gain3.y, gain4.u) annotation(
    Line(points = {{11, -26}, {18, -26}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.2")));
end RLCblock;
