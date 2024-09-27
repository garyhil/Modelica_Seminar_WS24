model FMDS_Code

import Modelica.Units.SI;

constant  SI.Acceleration                 g = -9.81 "Erdbeschleunigung";
parameter SI.Mass                         m = 1.0   "Masse in kg";
parameter SI.TranslationalSpringConstant  c = -50   "Fedekonstante in N/m";
parameter SI.TranslationalDampingConstant d = -0.5  "Dämpferkonstante in Ns/m";

SI.Length       x  "Auslenkung der Masse aus der Ruheposition";
SI.Velocity     v  "Geschwindigkeit der Masse";
SI.Acceleration a  "Beschleunigung der Masse";

equation
der(x) = v;
der(v) = a;
m * a = g + c*x + d*v; 

annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.002));
end FMDS_Code;
