package FDMS_Connector_VOrlesung
   
connector mechanisch
    Modelica.Units.SI.Length s;
    flow Modelica.Units.SI.Force f;
    annotation(
      Icon(graphics = {Rectangle(origin = {-1, 0}, fillColor = {5, 98, 0}, fillPattern = FillPattern.Solid, extent = {{-79, 80}, {79, -80}})}));
end mechanisch;

  model Decke
    mechanisch aufhaengung annotation(
      Placement(visible = true, transformation(origin = {2, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {2, 70}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  equation
  aufhaengung.s = 0;
  annotation(
      Icon(graphics = {Rectangle(origin = {0, 76}, fillPattern = FillPattern.Solid, extent = {{-100, 4}, {100, -4}})}, coordinateSystem(extent = {{-100, 60}, {100, 90}})),
  Diagram(coordinateSystem(extent = {{-100, 60}, {100, 90}})));
  
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
  mechanisch aufhaengung annotation(
      Placement(visible = true, transformation(origin = {2, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {2, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  
  equation
a = der(v);
  v = der(aufhaengung.s);
  aufhaengung.f = m*a + m*g;
  
  
  annotation(
      Icon(graphics = {Rectangle(origin = {3, -1}, fillPattern = FillPattern.Solid, extent = {{-57, 37}, {57, -37}})}));
end Gewicht;

model Model
   FDMS_Connector_VOrlesung.Decke decke annotation(
      Placement(visible = true, transformation(origin = {-0.333336, 5.1}, extent = {{-97.6667, 58.6}, {97.6667, 87.9}}, rotation = 0)));
   FDMS_Connector_VOrlesung.Gewicht gewicht annotation(
      Placement(visible = true, transformation(origin = {12, -66}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
   FDMS_Connector_VOrlesung.Feder feder annotation(
      Placement(visible = true, transformation(origin = {53, -3}, extent = {{-31, -31}, {31, 31}}, rotation = 0)));
   FDMS_Connector_VOrlesung.Daempfer daempfer annotation(
      Placement(visible = true, transformation(origin = {-50, -4}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));

equation
  connect(feder.side_b, gewicht.aufhaengung) annotation(
      Line(points = {{53, -15}, {13, -15}, {13, -56}}));
  connect(decke.aufhaengung, feder.side_a) annotation(
      Line(points = {{2, 74}, {52, 74}, {52, 22}}));
  connect(daempfer.side_a, decke.aufhaengung) annotation(
      Line(points = {{-50, 14}, {2, 14}, {2, 74}}));
  connect(daempfer.side_b, gewicht.aufhaengung) annotation(
      Line(points = {{-50, -12}, {12, -12}, {12, -56}}));
  end Model;

  model Feder
  
  //Parameter
  Real c(unit="N/m") = 50 "Federkonstante";
  //Connector
  mechanisch side_a annotation(
      Placement(visible = true, transformation(origin = {-2, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-2, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  mechanisch side_b annotation(
      Placement(visible = true, transformation(origin = {0, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
side_a.f + side_b.f = 0;
  side_a.f = c * (side_a.s - side_b.s);
  
  
  annotation(
      Icon(graphics = {Line(origin = {0, 20}, points = {{40, 60}, {-40, 60}, {38, 20}, {-38, 20}, {38, -20}, {-40, -20}, {38, -60}, {-40, -60}}, thickness = 1)}));
end Feder;

  model Daempfer
  
  //Parameter
  Real d(unit="Ns/m") = 0.5 "Dämpferkonstante";
  //Connectors
  mechanisch side_a annotation(
      Placement(visible = true, transformation(origin = {0, 88}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  mechanisch side_b annotation(
      Placement(visible = true, transformation(origin = {0, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  equation
side_a.f + side_b.f = 0;
  side_a.f = d * (der(side_a.s) - der(side_b.s));
  
  
  
  annotation(
      Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
  Icon(graphics = {Line(origin = {0.5, 40}, points = {{-0.5, 38}, {-0.5, -38}, {-24.5, -38}, {23.5, -38}}), Line(origin = {4.9982, 33}, points = {{-46.9982, 49}, {-46.9982, -49}, {47.0018, -49}, {39.0018, 45}})}));
end Daempfer;
end FDMS_Connector_VOrlesung;
