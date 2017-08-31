within MasterProject.Interfaces;
partial block Controller
  extends Modelica.Blocks.Interfaces.SVcontrol;

  annotation (defaultComponentName="Controller",
    Icon(coordinateSystem(initialScale = 0.1),
      graphics = {
        Line(points={{-80,78},{-80,-90}}, color={192,192,192}),
        Line(points={{-90,-80},{82,-80}}, color={192,192,192}),
        Line(points={{-80,-80},{-80,-20},{30,60},{80,60}}, color={0,0,127}),
        Polygon(points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
        Polygon(points={{90,-80},{68,-72},{68,-88},{90,-80}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid)
      }
    )
  );
end Controller;
