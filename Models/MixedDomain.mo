within MasterProject.Models;
model MixedDomain
  extends MasterProject.Interfaces.Actuator;
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage1 annotation(
    Placement(visible = true, transformation(origin = {-52, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 1)  annotation(
    Placement(visible = true, transformation(origin = {-32, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Inductor inductor1(L = 1)  annotation(
    Placement(visible = true, transformation(origin = {-2, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.EMF emf annotation(
    Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 1)  annotation(
    Placement(visible = true, transformation(origin = {54, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  connect(inertia1.flange_a, flange) annotation(
    Line(points = {{64, 0}, {98, 0}, {98, 0}, {100, 0}}));
  connect(tau, signalVoltage1.v) annotation(
    Line(points = {{-120, 0}, {-60, 0}, {-60, 0}, {-58, 0}}, color = {0, 0, 127}));
  connect(emf.support, internalSupport) annotation(
    Line(points = {{10, 0}, {0, 0}, {0, -80}, {0, -80}}));
  connect(inertia1.flange_a, flange) annotation(
    Line(points = {{64, 0}, {100, 0}, {100, 0}, {100, 0}}));
  connect(emf.flange, inertia1.flange_b) annotation(
    Line(points = {{30, 0}, {44, 0}, {44, 0}, {44, 0}}));
  connect(emf.n, signalVoltage1.p) annotation(
    Line(points = {{20, -10}, {20, -10}, {20, -20}, {-52, -20}, {-52, -10}, {-52, -10}}, color = {0, 0, 255}));
  connect(emf.p, inductor1.n) annotation(
    Line(points = {{20, 10}, {20, 10}, {20, 20}, {8, 20}, {8, 20}}, color = {0, 0, 255}));
  connect(signalVoltage1.n, resistor1.p) annotation(
    Line(points = {{-52, 10}, {-52, 10}, {-52, 20}, {-42, 20}, {-42, 20}}, color = {0, 0, 255}));
  connect(resistor1.n, inductor1.p) annotation(
    Line(points = {{-22, 20}, {-12, 20}, {-12, 20}, {-12, 20}}, color = {0, 0, 255}));
end MixedDomain;
