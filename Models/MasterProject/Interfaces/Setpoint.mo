within MasterProject.Interfaces;
partial block Setpoint
  extends Modelica.Blocks.Interfaces.SignalSource;
  annotation(
    Icon(
      graphics = {
        Line(points={{-80,68},{-80,-80}}, color={192,192,192}),
        Line(points={{-90,-70},{82,-70}}, color={192,192,192}),
        Line(points={{-80,-70},{-40,-70},{31,38}}),
        Line(points={{31,38},{86,38}}),
        Polygon(
          points={{-80,90},{-88,68},{-72,68},{-80,90}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{90,-70},{68,-62},{68,-78},{90,-70}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid)
      }
    )
  );
end Setpoint;
