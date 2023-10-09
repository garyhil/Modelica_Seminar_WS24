model Tank
  //Konstanten
  constant Modelica.Units.SI.Acceleration g = Modelica.Constants.g_n "Gravitationsbeschleunigung im Schwerefeld der Erde";
  constant Modelica.Units.SI.Acceleration p_amb = 101325 "Umgebungsdruck in Pascal";
  //Parameter
  parameter Modelica.Units.SI.Length d_T = 1.0 "Durchmesser des Tanks";
  parameter Modelica.Units.SI.Length d_o = 0.1 "Durchmesser des Auslasses";
  parameter Modelica.Units.SI.Area A_T = d_T^2/4*Modelica.Constants.pi "Grundfläche des Tanks";
  parameter Modelica.Units.SI.Area A_o = d_o^2/4*Modelica.Constants.pi "Querschnitt des Auslasses";
  parameter Modelica.Units.SI.Density rho_W = 997.0 "Dichte von Wasser bei Zimmertemperatur";
  //Variablen
  Modelica.Units.SI.Height h(start = 2.0) "Wasserpegel über Tankboden";
  Modelica.Units.SI.Volume V "Wasservolumen im Tank";
  Modelica.Units.SI.MassFlowRate m "Massenstrom aus dem Tank";
  Modelica.Units.SI.Velocity c "Geschwindigkeit des ausströmenden Mediums";
  Modelica.Units.SI.Pressure p "Druck am Boden des Tanks";
equation
  V = h*A_T;
  //c = if noEvent(h >= 0) then sqrt(2*g*h) else 0;
  c = smooth(0, if h >= 0 then sqrt(2*g*h) else 0);
  //c = sqrt(2*g*h);
  p = p_amb + rho_W*g*h + 0.5*rho_W*c^2;
  m = c*A_o*rho_W;
  der(V) = -m/rho_W;
  annotation(
    Diagram(graphics = {Rectangle(origin = {0, 10}, extent = {{-40, 50}, {40, -50}}), Rectangle(origin = {43, -36}, fillColor = {30, 90, 231}, fillPattern = FillPattern.Solid, extent = {{3, 4}, {-3, -4}}), Rectangle(origin = {0, -10}, fillColor = {30, 90, 231}, fillPattern = FillPattern.Solid, extent = {{-40, 30}, {40, -30}})}),
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.002));
end Tank;
