within MasterProject.Components;
model Controller
  extends MasterProject.Interfaces.Controller;
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 20)  annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(gain1.y, y) annotation(
    Line(points = {{62, 0}, {106, 0}, {106, 0}, {110, 0}}, color = {0, 0, 127}));
  connect(feedback1.y, gain1.u) annotation(
    Line(points = {{10, 0}, {36, 0}, {36, 0}, {38, 0}}, color = {0, 0, 127}));
  connect(feedback1.u2, u_m) annotation(
    Line(points = {{0, -8}, {0, -8}, {0, -120}, {0, -120}}, color = {0, 0, 127}));
  connect(feedback1.u1, u_s) annotation(
    Line(points = {{-8, 0}, {-110, 0}, {-110, 0}, {-120, 0}}, color = {0, 0, 127}));
  annotation (defaultComponentName="PID",
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}), graphics={
        Line(points={{-80,78},{-80,-90}}, color={192,192,192}),
        Polygon(
          points={{-80,90},{-88,68},{-72,68},{-80,90}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-90,-80},{82,-80}}, color={192,192,192}),
        Polygon(
          points={{90,-80},{68,-72},{68,-88},{90,-80}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-80,-80},{-80,-20},{30,60},{80,60}}, color={0,0,127}),
        Text(
          extent={{-20,-20},{80,-60}},
          lineColor={192,192,192},
          textString="%controllerType"),
        Line(
          visible=strict,
          points={{30,60},{81,60}},
          color={255,0,0})}),
    Documentation(info="<html>
<p>
Via parameter <b>controllerType</b> either <b>P</b>, <b>PI</b>, <b>PD</b>,
or <b>PID</b> can be selected. If, e.g., PI is selected, all components belonging to the
D-part are removed from the block (via conditional declarations).
The example model
<a href=\"modelica://Modelica.Blocks.Examples.PID_Controller\">Modelica.Blocks.Examples.PID_Controller</a>
demonstrates the usage of this controller.
Several practical aspects of PID controller design are incorporated
according to chapter 3 of the book:
</p>

<dl>
<dt>&Aring;str&ouml;m K.J., and H&auml;gglund T.:</dt>
<dd> <b>PID Controllers: Theory, Design, and Tuning</b>.
   Instrument Society of America, 2nd edition, 1995.
</dd>
</dl>

<p>
Besides the additive <b>proportional, integral</b> and <b>derivative</b>
part of this controller, the following features are present:
</p>
<ul>
<li> The output of this controller is limited. If the controller is
   in its limits, anti-windup compensation is activated to drive
   the integrator state to zero. </li>
<li> The high-frequency gain of the derivative part is limited
   to avoid excessive amplification of measurement noise.</li>
<li> Setpoint weighting is present, which allows to weight
   the setpoint in the proportional and the derivative part
   independently from the measurement. The controller will respond
   to load disturbances and measurement noise independently of this setting
   (parameters wp, wd). However, setpoint changes will depend on this
   setting. For example, it is useful to set the setpoint weight wd
   for the derivative part to zero, if steps may occur in the
   setpoint signal.</li>
</ul>

<p>
The parameters of the controller can be manually adjusted by performing
simulations of the closed loop system (= controller + plant connected
together) and using the following strategy:
</p>

<ol>
<li> Set very large limits, e.g., yMax = Modelica.Constants.inf</li>
<li> Select a <b>P</b>-controller and manually enlarge parameter <b>k</b>
   (the total gain of the controller) until the closed-loop response
   cannot be improved any more.</li>
<li> Select a <b>PI</b>-controller and manually adjust parameters
   <b>k</b> and <b>Ti</b> (the time constant of the integrator).
   The first value of Ti can be selected, such that it is in the
   order of the time constant of the oscillations occurring with
   the P-controller. If, e.g., vibrations in the order of T=10 ms
   occur in the previous step, start with Ti=0.01 s.</li>
<li> If you want to make the reaction of the control loop faster
   (but probably less robust against disturbances and measurement noise)
   select a <b>PID</b>-Controller and manually adjust parameters
   <b>k</b>, <b>Ti</b>, <b>Td</b> (time constant of derivative block).</li>
<li> Set the limits yMax and yMin according to your specification.</li>
<li> Perform simulations such that the output of the PID controller
   goes in its limits. Tune <b>Ni</b> (Ni*Ti is the time constant of
   the anti-windup compensation) such that the input to the limiter
   block (= limiter.u) goes quickly enough back to its limits.
   If Ni is decreased, this happens faster. If Ni=infinity, the
   anti-windup compensation is switched off and the controller works bad.</li>
</ol>

<p>
<b>Initialization</b>
</p>

<p>
This block can be initialized in different
ways controlled by parameter <b>initType</b>. The possible
values of initType are defined in
<a href=\"modelica://Modelica.Blocks.Types.InitPID\">Modelica.Blocks.Types.InitPID</a>.
This type is identical to
<a href=\"modelica://Modelica.Blocks.Types.Init\">Types.Init</a>,
with the only exception that the additional option
<b>DoNotUse_InitialIntegratorState</b> is added for
backward compatibility reasons (= integrator is initialized with
InitialState whereas differential part is initialized with
NoInit which was the initialization in version 2.2 of the Modelica
standard library).
</p>

<p>
Based on the setting of initType, the integrator (I) and derivative (D)
blocks inside the PID controller are initialized according to the following table:
</p>

<table border=1 cellspacing=0 cellpadding=2>
<tr><td valign=\"top\"><b>initType</b></td>
    <td valign=\"top\"><b>I.initType</b></td>
    <td valign=\"top\"><b>D.initType</b></td></tr>

<tr><td valign=\"top\"><b>NoInit</b></td>
    <td valign=\"top\">NoInit</td>
    <td valign=\"top\">NoInit</td></tr>

<tr><td valign=\"top\"><b>SteadyState</b></td>
    <td valign=\"top\">SteadyState</td>
    <td valign=\"top\">SteadyState</td></tr>

<tr><td valign=\"top\"><b>InitialState</b></td>
    <td valign=\"top\">InitialState</td>
    <td valign=\"top\">InitialState</td></tr>

<tr><td valign=\"top\"><b>InitialOutput</b><br>
        and initial equation: y = y_start</td>
    <td valign=\"top\">NoInit</td>
    <td valign=\"top\">SteadyState</td></tr>

<tr><td valign=\"top\"><b>DoNotUse_InitialIntegratorState</b></td>
    <td valign=\"top\">InitialState</td>
    <td valign=\"top\">NoInit</td></tr>
</table>

<p>
In many cases, the most useful initial condition is
<b>SteadyState</b> because initial transients are then no longer
present. If initType = InitPID.SteadyState, then in some
cases difficulties might occur. The reason is the
equation of the integrator:
</p>

<pre>
 <b>der</b>(y) = k*u;
</pre>

<p>
The steady state equation \"der(x)=0\" leads to the condition that the input u to the
integrator is zero. If the input u is already (directly or indirectly) defined
by another initial condition, then the initialization problem is <b>singular</b>
(has none or infinitely many solutions). This situation occurs often
for mechanical systems, where, e.g., u = desiredSpeed - measuredSpeed and
since speed is both a state and a derivative, it is natural to
initialize it with zero. As sketched this is, however, not possible.
The solution is to not initialize u_m or the variable that is used
to compute u_m by an algebraic equation.
</p>

<p>
If parameter <b>limitAtInit</b> = <b>false</b>, the limits at the
output of this controller block are removed from the initialization problem which
leads to a much simpler equation system. After initialization has been
performed, it is checked via an assert whether the output is in the
defined limits. For backward compatibility reasons
<b>limitAtInit</b> = <b>true</b>. In most cases it is best
to use <b>limitAtInit</b> = <b>false</b>.
</p>
</html>"));
end Controller;
