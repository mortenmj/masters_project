within MasterProject.Models;
model RLCcomponents
  import AB = Modelica.Electrical.Analog.Basic;
  import AS = Modelica.Electrical.Analog.Sources;
  import SI = Modelica.SIunits;

  AS.SineVoltage sineVoltage1(V = Vs)  annotation(
    Placement(visible = true, transformation(origin = {-24, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = R1)  annotation(
    Placement(visible = true, transformation(origin = {0, 12}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Resistor resistor2(R = R2)  annotation(
    Placement(visible = true, transformation(origin = {30, 12}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor1(C = C)  annotation(
    Placement(visible = true, transformation(origin = {0, -12}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Inductor inductor1(L = L)  annotation(
    Placement(visible = true, transformation(origin = {30, -12}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));

  parameter SI.Voltage Vs;
  parameter SI.Resistance R1, R2;
  parameter SI.Conductance C;
  parameter SI.Inductance L;

equation
  connect(sineVoltage1.n, inductor1.n) annotation(
    Line(points = {{-24, -10}, {-24, -10}, {-24, -24}, {30, -24}, {30, -22}, {30, -22}}, color = {0, 0, 255}));
  connect(sineVoltage1.n, capacitor1.n) annotation(
    Line(points = {{-24, -10}, {-24, -10}, {-24, -24}, {0, -24}, {0, -22}, {0, -22}}, color = {0, 0, 255}));
  connect(sineVoltage1.p, resistor2.p) annotation(
    Line(points = {{-24, 10}, {-24, 10}, {-24, 24}, {30, 24}, {30, 22}, {30, 22}}, color = {0, 0, 255}));
  connect(sineVoltage1.p, resistor1.p) annotation(
    Line(points = {{-24, 10}, {-24, 10}, {-24, 24}, {0, 24}, {0, 22}, {0, 22}}, color = {0, 0, 255}));
  connect(resistor2.n, inductor1.p) annotation(
    Line(points = {{30, 2}, {30, -2}}, color = {0, 0, 255}));
  connect(resistor1.n, capacitor1.p) annotation(
    Line(points = {{0, 2}, {0, -2}}, color = {0, 0, 255}));
  annotation(
    uses(Modelica(version = "3.2.2")));
end RLCcomponents;
