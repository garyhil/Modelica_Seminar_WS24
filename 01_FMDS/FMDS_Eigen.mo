package FMDS_Eigen

connector mechanisch
    Modelica.Units.SI.Length s;
    flow Modelica.Units.SI.Force f;annotation(
      Icon(graphics = {Rectangle(fillColor = {0, 95, 8}, fillPattern = FillPattern.Solid, extent = {{-20, 20}, {20, -20}})}, coordinateSystem(extent = {{-10, -10}, {10, 10}})),
    Diagram(coordinateSystem(extent = {{-10, -10}, {10, 10}})));
end mechanisch;

model Gewicht
    //Constants
    Modelica.Units.SI.Acceleration g = Modelica.Constants.g_n;

    //Parameter
    Modelica.Units.SI.Mass m = 5 "Masse des Gewichtes";

    //Variablen
    Modelica.Units.SI.Velocity v "Geschwindigkeit des Gewichts in m/s";
    Modelica.Units.SI.Acceleration a "Geschwindigkeit des Gewichts in m/s^2";
    //Connectoren
    mechanisch aufhaengung(s.start=5) annotation(
      Placement(visible = true, transformation(origin = {0, 30}, extent = {{-1, -1}, {1, 1}}, rotation = 0), iconTransformation(origin = {0.525746, 19.4743}, extent = {{-3.52575, -3.52575}, {3.52575, 3.52575}}, rotation = 0)));

equation
    a = der(v);
    v = der(aufhaengung.s);
    aufhaengung.f = m * a + m * g;

annotation(
      Icon(graphics = {Rectangle(origin = {0, -2}, fillPattern = FillPattern.Solid, extent = {{-40, 22}, {40, -22}})}, coordinateSystem(extent = {{-45, -25}, {45, 25}})),
    Diagram(coordinateSystem(extent = {{-45, -25}, {45, 25}})));
end Gewicht;

model Decke
   //Connector
   mechanisch haken annotation(
      Placement(visible = true, transformation(origin = {-22, 50}, extent = {{-1, -1}, {1, 1}}, rotation = 0), iconTransformation(origin = {1, -1}, extent = {{2, 2}, {-2, -2}}, rotation = 0)));

equation
    haken.s = 5;
annotation(
      Diagram(coordinateSystem(extent = {{-100, -15}, {100, 15}})),
    Icon(graphics = {Rectangle(origin = {0, 3}, fillPattern = FillPattern.Forward, extent = {{-100, 3}, {100, -3}})}, coordinateSystem(extent = {{-100, -15}, {100, 15}})));
end Decke;

model Feder
    
    //Parameter
    Real c(unit="N/m") = 50  "Federkonstante";
    
    //Connectoren
    FMDS_Eigen.mechanisch aufhaengung_a annotation(
      Placement(visible = true, transformation(origin = {0, 52}, extent = {{-1, -1}, {1, 1}}, rotation = 0), iconTransformation(origin = {0, 48}, extent = {{-1, -1}, {1, 1}}, rotation = 0)));
    FMDS_Eigen.mechanisch aufhaengung_b annotation(
      Placement(visible = true, transformation(origin = {-2, -36}, extent = {{-1, -1}, {1, 1}}, rotation = 0), iconTransformation(origin = {0, -32}, extent = {{-1, -1}, {1, 1}}, rotation = 0)));
    
equation
  aufhaengung_a.f + aufhaengung_b.f = 0;
  aufhaengung_a.f = c * (aufhaengung_a.s - aufhaengung_b.s);
annotation(
      Icon(graphics = {Line(origin = {-1, 8.24}, points = {{21, 40}, {-17, 40}, {21, 20}, {-19, 20}, {21, 0}, {-19, 0}, {21, -20}, {-19, -20}, {21, -40}, {-21, -40}, {-21, -40}}, thickness = 1)}, coordinateSystem(extent = {{-25, -40}, {25, 60}})),
    Diagram(coordinateSystem(extent = {{-25, -40}, {25, 60}})));

end Feder;

model Daempfer
    //Parameter
    Real d(unit="Ns/m") = 0.5 "Dämpferkonstante";
    
    //Connectoren
    mechanisch aufhaengung_a annotation(
      Placement(visible = true, transformation(origin = {0, 60}, extent = {{-1, -1}, {1, 1}}, rotation = 0), iconTransformation(origin = {0, 60}, extent = {{-1, -1}, {1, 1}}, rotation = 0)));
    mechanisch aufhaengung_b annotation(
      Placement(visible = true, transformation(origin = {0, -38}, extent = {{-1, -1}, {1, 1}}, rotation = 0), iconTransformation(origin = {0, -40}, extent = {{-1, -1}, {1, 1}}, rotation = 0)));

equation
  aufhaengung_a.f + aufhaengung_b.f = 0;
  aufhaengung_a.f = d * (der(aufhaengung_a.s) - der(aufhaengung_b.s));

annotation(
      Icon(graphics = {Line(origin = {0, 29}, points = {{0, 29}, {0, -29}, {0, -29}}, thickness = 1), Line(points = {{-20, 0}, {20, 0}}, thickness = 1), Line(origin = {0, 1}, points = {{-20, 41}, {-20, -41}, {20, -41}, {20, 39}}, thickness = 1)}, coordinateSystem(extent = {{-25, -45}, {25, 65}})),
    Diagram(coordinateSystem(extent = {{-25, -45}, {25, 65}})));

end Daempfer;

  model FMDS
  FMDS_Eigen.Gewicht gewicht annotation(
      Placement(visible = true, transformation(origin = {-0.200001, -66.1111}, extent = {{-26.3, -14.6111}, {26.3, 14.6111}}, rotation = 0)));
  FMDS_Eigen.Decke decke annotation(
      Placement(visible = true, transformation(origin = {-4, 78}, extent = {{-90, -13.5}, {90, 13.5}}, rotation = 0)));
  FMDS_Eigen.Feder feder annotation(
      Placement(visible = true, transformation(origin = {-19, 17.6}, extent = {{-13.5, -21.6}, {13.5, 32.4}}, rotation = 0)));
  FMDS_Eigen.Daempfer daempfer annotation(
      Placement(visible = true, transformation(origin = {20.1818, 16.7273}, extent = {{-10.6818, -19.2273}, {10.6818, 27.7727}}, rotation = 0)));
  equation
  connect(daempfer.aufhaengung_a, decke.haken) annotation(
      Line(points = {{20, 42}, {-4, 42}, {-4, 78}}));
  connect(feder.aufhaengung_a, decke.haken) annotation(
      Line(points = {{-18, 44}, {-4, 44}, {-4, 78}}));
  connect(daempfer.aufhaengung_b, gewicht.aufhaengung) annotation(
      Line(points = {{20, 0}, {0, 0}, {0, -54}}));
  connect(feder.aufhaengung_b, gewicht.aufhaengung) annotation(
      Line(points = {{-18, 0}, {0, 0}, {0, -54}}));
  end FMDS;

end FMDS_Eigen;
