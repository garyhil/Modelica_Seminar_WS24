model Temperature_Code
  parameter Real lambda = 0.3 "Wärmeleitkoeffizient der Wand [W/m*K]";
  parameter Real z = 0.02 "Dicke der Wand in Metern [m]";
  parameter Real A = 5.0 "Querschnittsfläche der Wand [m^2]";
  parameter Real C1 = 500 "Wärmekapzität Medium 1 [W*s/K]";
  parameter Real C2 = 500 "Wärmekapzität Medium 1 [W*s/K]";
  Real T1(start = 303.15) "Temperature on Side 1 [K]";
  Real T2(start = 283.15) "Temperature on Side 2 [K]";
  Real dQ "Wärmestrom [W/s]";
equation
  dQ = lambda/z*A*(T1 - T2);
  C1*der(T1) = -dQ;
  C1*der(T1) + C2*der(T2) = 0;
  annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.02));
end Temperature_Code;
