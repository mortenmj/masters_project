within MasterProject.Models;
model InertialBasic
  import MRC = Modelica.Mechanics.Rotational.Components;

  MRC.Fixed fixed1;
  MRC.Inertia inertia1(J = 0.4),
  MRC.Inertia inertia2(J = 1.0);
  MRC.SpringDamper springDamper1(c = 11.0, d = 0.2),
  MRC.SpringDamper springDamper2(c = 5.0, d = 1.0);

equation
  connect(inertia1.flange_b, springDamper1.flange_a);
  connect(springDamper1.flange_b, inertia2.flange_a);
  connect(inertia2.flange_b, springDamper2.flange_a);
  connect(springDamper2.flange_b, fixed1.flange);
end InertialBasic;
