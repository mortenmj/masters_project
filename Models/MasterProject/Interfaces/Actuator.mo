within MasterProject.Interfaces;
partial model Actuator
  "Interface for actuator"
  extends Modelica.Blocks.Icons.Block;
  extends Modelica.Mechanics.Rotational.Interfaces.PartialOneFlangeAndSupport;
  import Modelica.Blocks.Interfaces.RealInput;

  RealInput tau annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -2}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Icon(
      graphics = {
        Line(points={{-88,0},{-64,30},{-36,52},{-2,62},{28,56},{48,44},{64,28},{76,14},{86,0}}, 
             thickness=0.5,
             smooth=Smooth.Bezier),
        Polygon(points={{86,0},{66,58},{37,27},{86,0}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid)
      }
    )
  );
end Actuator;
