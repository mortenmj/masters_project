within MasterProject.Models;
model BouncingBall
    type Height=Real(unit="m");
    import Modelica.SIunits.Velocity;
    import g = Modelica.Constants.g_n;

    parameter Real e = 0.8 "Coefficient of restitution";
    parameter Height h0 = 5 "Initial height";

    Height h(start=h0, fixed=true) "Height";
    Velocity v(start=0.0, fixed=true) "Velocity";
    Height ground "Surface height";
equation
    der(h) = v;
    der(v) = -g;
    ground = max(0, h0 - 1 - floor(time));

    when h < ground then
        reinit(v, -e*pre(v));
    end when;
end BouncingBall;
