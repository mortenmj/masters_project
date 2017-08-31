within MasterProject.Components;

model MixedDomainActuator
  extends MasterProject.Interfaces.Actuator;
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage1 annotation(
    Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-16, -16}, {16, 16}}, rotation = 90)));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 1) annotation(
    Placement(visible = true, transformation(origin = {-53, 41}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Inductor inductor1(L = 1) annotation(
    Placement(visible = true, transformation(origin = {1, 41}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.EMF emf annotation(
    Placement(visible = true, transformation(origin = {32, 2.22045e-16}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {32, -56}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 1)  annotation(
    Placement(visible = true, transformation(origin = {74, 0}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
equation
  connect(inertia1.flange_b, flange) annotation(
    Line(points = {{90, 0}, {100, 0}, {100, 0}, {100, 0}}));
  connect(emf.flange, inertia1.flange_a) annotation(
    Line(points = {{50, 0}, {60, 0}, {60, 0}, {58, 0}}));
  connect(emf.n, ground1.p) annotation(
    Line(points = {{32, -18}, {32, -36}}, color = {0, 0, 255}));
  connect(emf.n, signalVoltage1.p) annotation(
    Line(points = {{32, -18}, {32, -28}, {-80, -28}, {-80, -16}}, color = {0, 0, 255}));
  connect(tau, signalVoltage1.v) annotation(
    Line(points = {{-120, 0}, {-91, 0}}, color = {0, 0, 127}));
  connect(signalVoltage1.n, resistor1.p) annotation(
    Line(points = {{-80, 16}, {-80, 41}, {-68, 41}}, color = {0, 0, 255}));
  connect(resistor1.n, inductor1.p) annotation(
    Line(points = {{-38, 41}, {-14, 41}}, color = {0, 0, 255}));
  connect(inductor1.n, emf.p) annotation(
    Line(points = {{16, 41}, {32, 41}, {32, 18}}, color = {0, 0, 255}));
  connect(emf.support, internalSupport) annotation(
    Line(points = {{14, 0}, {0, 0}, {0, -80}}));
annotation(
    Diagram,
    Icon,
    __OpenModelica_commandLineOptions = "");end MixedDomainActuator;
