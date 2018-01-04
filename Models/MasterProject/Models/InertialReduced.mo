within MasterProject.Models;
model InertialReduced
  import MasterProject.Components.IdealActuator;
  import Modelica.Mechanics.Rotational.Sensors.SpeedSensor;
  extends MasterProject.Architectures.InertialReduced(
    redeclare IdealActuator actuator,
    redeclare SpeedSensor sensor
  );
equation
end InertialReduced;
