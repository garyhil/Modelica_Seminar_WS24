model FMDS_Code

constant Real   g = -9.81 "Erdbeschleunigung";
parameter Real  m = 1.0   "Masse in kg";
parameter Real  c = -50   "Fedekonstante in N/m";
parameter Real  d = -0.5  "Dämpferkonstante in Ns/m";

Real x  "Auslenkung der Masse aus der Ruheposition";
Real v  "Geschwindigkeit der Masse";
Real a  "Beschleunigung der Masse";

equation
der(x) = v;
der(v) = a;
m * a = g + c*x + d*v; 

annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.002));
end FMDS_Code;
