within MasterProject.Models;
block InertialCode
  import SI = Modelica.SIunits;
  
  parameter SI.MomentOfInertia J1 = 0.4, J2 = 1.0;
  parameter SI.RotationalSpringConstant c1 = 11, c2 = 5;
  parameter SI.RotationalDampingConstant d1 = 0.2, d2 = 1.0;

  SI.Angle phi1, phi2;
  SI.AngularVelocity w1, w2;

initial equation
  phi1 = 0;
  phi2 = 1;
  w1   = 0;
  w2   = 0;
 
equation
  der(phi1)  = w1;
  der(phi2)  = w2;
  J1*der(w1) = c1*(phi2-phi1)+d1*(w2-w1);
  J2*der(w2) = c1*(phi1-phi2)+d1*(w1-w2)-c2*phi2-d2*w2;
end InertialCode;
