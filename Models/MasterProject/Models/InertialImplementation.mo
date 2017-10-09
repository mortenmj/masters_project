within MasterProject.Models;
model InertialImplementation
  import MasterProject.Components.Controller;
  import Modelica.Mechanics.Rotational.Sources.Torque;
  import Modelica.Blocks.Sources.Pulse;
  import Modelica.Mechanics.Rotational.Sensors.SpeedSensor;
  extends MasterProject.Architectures.InertialArchitecture(
    redeclare Pulse reference,
    redeclare Controller controller,
    redeclare Torque actuator,
    redeclare SpeedSensor sensor
  );
equation
end InertialImplementation;
