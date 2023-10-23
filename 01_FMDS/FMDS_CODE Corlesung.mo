model FMDS_Code

//Constants
constant Modelica.Units.SI.Acceleration g = -9.81 "Beschleunigung im Erdschwerefeld m/s^2";


//Parameter
parameter Modelica.Units.SI.Mass m = 1.0 "Masse in kg";
parameter Real c(unit="N/m") = -50 "Federoknstante in N/m";
parameter Real d(unit="Ns/m") = -0.5 "Dämpferkonstante in Ns/m";

//Variables
Modelica.Units.SI.Length x "Auslenkung der Masse aus der Ruheposition";
Modelica.Units.SI.Velocity v(start = 2) "Geschwindigkeit der Masse";
Modelica.Units.SI.Acceleration a "Beschleunigung der Masse";

equation
m*a = m* g + c*x + d*v;
a = der(v);
v = der(x);

end FMDS_Code;
