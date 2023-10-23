package FDMS_Connector_VOrlesung
   
connector mechanisch
    Modelica.Units.SI.Length s;
    flow Modelica.Units.SI.Force f;
    annotation(
      Icon(graphics = {Rectangle(origin = {-1, 0}, fillColor = {5, 98, 0}, fillPattern = FillPattern.Solid, extent = {{-79, 80}, {79, -80}})}));
  end mechanisch;

  model Decke
    mechanisch mechanisch annotation(
      Placement(visible = true, transformation(origin = {2, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {2, 70}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  equation
  s = 0;
  annotation(
      Icon(graphics = {Rectangle(origin = {0, 76}, fillPattern = FillPattern.Solid, extent = {{-100, 4}, {100, -4}})}));
  
  end Decke;

  model Gewicht
  
  //Constants
  constant Modelica.Units.SI.Acceleration g = Modelica.Constants.g_n;
  //Parameter
  parameter Modelica.Units.SI.Mass m = 5.0 "Masse des Gewichts";
  
  //Variablen
  Modelica.Units.SI.Velocity v "Geschwindigkeit";
  Modelica.Units.SI.Acceleration a "Beschleunigung";
  
  //Connectoren
  mechanisch mechanisch annotation(
      Placement(visible = true, transformation(origin = {2, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {2, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  
  equation
a = der(v);
  v = der(mechanisch.s);
  mechanisch.f = m*a + m*g;
  
  
  annotation(
      Icon(graphics = {Rectangle(origin = {3, -1}, fillPattern = FillPattern.Solid, extent = {{-57, 37}, {57, -37}})}));
end Gewicht;
end FDMS_Connector_VOrlesung;
