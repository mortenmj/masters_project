within MasterProject.Models;
model InertialImplementation
  import MasterProject.Components.Controller;
  import MasterProject.Components.IdealActuator;
  import Modelica.Blocks.Sources.Pulse;
  import Modelica.Mechanics.Rotational.Sensors.SpeedSensor;
  extends MasterProject.Architectures.InertialArchitecture(
    redeclare Pulse reference,
    redeclare Controller controller,
    redeclare IdealActuator actuator,
    redeclare SpeedSensor sensor
  );
equation
end InertialImplementation;
