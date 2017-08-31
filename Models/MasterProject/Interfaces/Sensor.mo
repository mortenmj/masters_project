within MasterProject.Interfaces;
partial model Sensor
  "Interface for sensors"
  extends Modelica.Blocks.Icons.Block;
  extends Modelica.Icons.RotationalSensor;
  import Modelica.Mechanics.Rotational.Interfaces.Flange_a;
  import Modelica.Blocks.Interfaces.RealOutput;
  
  Flange_a flange "Flange that is measured" annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-102, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  RealOutput w "Connector of Real output signal" annotation (Placement(
        transformation(extent={{100,-10},{120,10}})));
  annotation(
    uses(Modelica(version = "3.2.2"))
  );
end Sensor;
