within MasterProject.Models;
model BouncingBall
    import Modelica.SIunits.Height;
    import Modelica.SIunits.Velocity;
    import g = Modelica.Constants.g_n;

    Height h "Height";
    Velocity v(start=0.0, fixed=true) "Velocity";

    parameter Real e = 0.8 "Coefficient of restitution";
    parameter Height h0 = 1 "Initial height";

initial equation
    h = h0;

equation
    v = der(h);
    der(v) = -g;
    when h <= 0.1 then
        reinit(v, -e*pre(v));
    end when;
end BouncingBall;
