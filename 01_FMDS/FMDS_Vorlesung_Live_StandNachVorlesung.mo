package FMDS
   
package Komponenten
   
model Masse
      //Konstanten
      constant Real g = 9.81 "Beschleunigung im Erdschwerefeld";
      //Parameter
      parameter Modelica.Units.SI.Mass mass = 5 "Masse in kg";
      //Variablen
      Modelica.Units.SI.Velocity v "Geschwindigkeit der Masse";
      Modelica.Units.SI.Acceleration a "Beschleunigung der Masse";
  FMDS.Connectoren.KraftWegConn kraftWegConn annotation(
        Placement(visible = true, transformation(origin = {-40, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      der(kraftWegConn.s) = v;
      der(v) = a;
      mass*a + mass*g + kraftWegConn.f = 0;
      annotation(
        Icon(graphics = {Rectangle( fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-100, 100}, {100, -100}}), Text(origin = {-3, 10}, textColor = {255, 255, 255}, extent = {{-85, 72}, {85, -72}}, textString = "m", textStyle = {TextStyle.Bold})}, coordinateSystem(extent = {{-100, -100}, {100, 100}})));
    end Masse;

    model Feder
    
    parameter Modelica.Units.SI.TranslationalSpringConstant c = 50 "Federkonstante";
  Connectoren.KraftWegConn kraftWegConn1 annotation(
        Placement(visible = true, transformation(origin = {0, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Connectoren.KraftWegConn kraftWegConn2 annotation(
        Placement(visible = true, transformation(origin = {0, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
kraftWegConn1.f = c * (kraftWegConn1.s - kraftWegConn2.s);
    kraftWegConn1.f + kraftWegConn2.f = 0; 
    end Feder;

    model Decke
  FMDS.Connectoren.KraftWegConn kraftWegConn annotation(
        Placement(visible = true, transformation(origin = {2, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
kraftWegConn.s = 0;
    
    annotation(
        Icon(graphics = {Rectangle(origin = {0, 2}, fillColor = {156, 156, 156}, fillPattern = FillPattern.Forward, extent = {{-100, 10}, {100, -10}})}, coordinateSystem(extent = {{-100, -20}, {100, 20}})),
  Diagram(coordinateSystem(extent = {{-100, -20}, {100, 20}})));
end Decke;
  end Komponenten;

  package Connectoren
  connector KraftWegConn
  flow Modelica.Units.SI.Force f;
  Modelica.Units.SI.Position s;
  
  annotation(
        Icon(graphics = {Ellipse(fillColor = {2, 98, 0}, fillPattern = FillPattern.Solid, extent = {{-40, 40}, {40, -40}})}, coordinateSystem(extent = {{-100, -100}, {100, 100}})),
  Diagram);
    end KraftWegConn;
  end Connectoren;

  package Tests
  model FMS
  FMDS.Komponenten.Decke decke annotation(
        Placement(visible = true, transformation(origin = {-1.90735e-06, 77.6}, extent = {{-87, -17.4}, {87, 17.4}}, rotation = 0)));
  FMDS.Komponenten.Masse masse annotation(
        Placement(visible = true, transformation(origin = {1, -51}, extent = {{-21, -21}, {21, 21}}, rotation = 0)));
    equation
  connect(decke.kraftWegConn, masse.kraftWegConn) annotation(
        Line(points = {{0, 68}, {0, 19}, {2, 19}, {2, -30}}));
    end FMS;
  end Tests;
end FMDS;
