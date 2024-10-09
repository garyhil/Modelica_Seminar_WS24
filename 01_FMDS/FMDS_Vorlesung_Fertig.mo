package FMDS
  package Komponenten
    model Masse
      //Konstanten
      import Modelica.Constants.g_n;
      //Parameter
      parameter Modelica.Units.SI.Mass mass = 5 "Masse in kg";
      //Variablen
      Modelica.Units.SI.Velocity v "Geschwindigkeit der Masse";
      Modelica.Units.SI.Acceleration a "Beschleunigung der Masse";
      FMDS.Connectoren.KraftWegConn kraftWegConn annotation(
        Placement(visible = true, transformation(origin = {-40, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      der(kraftWegConn.s) = v;
      der(v) = a;
      mass*a = mass*(-g_n) + kraftWegConn.f;
//Newtonsches Grundprinzip: Summe aller Kräfte = m*a
      annotation(
        Icon(graphics = {Rectangle(fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-20, 20}, {20, -20}}), Text(origin = {0, 1}, textColor = {255, 255, 255}, extent = {{-16, 11}, {16, -11}}, textString = "m", textStyle = {TextStyle.Bold})}, coordinateSystem(extent = {{-20, -20}, {20, 25}})),
        Diagram(coordinateSystem(extent = {{-20, -20}, {20, 25}})));
    end Masse;

    model Feder
      parameter Modelica.Units.SI.TranslationalSpringConstant c = 50 "Federkonstante";
      parameter Modelica.Units.SI.Length l_0 = 0 "Länge der Feder im entspannten Zustand";
      Connectoren.KraftWegConn kraftWegConn1 annotation(
        Placement(visible = true, transformation(origin = {0, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Connectoren.KraftWegConn kraftWegConn2 annotation(
        Placement(visible = true, transformation(origin = {0, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      kraftWegConn1.f = c*((kraftWegConn1.s - kraftWegConn2.s) - l_0);
//Hier sind nun zwei Wege mgölich um die Kraft für kraftWegConn2 anzugeben (es muss immer ein Weg auskommentiert sein)
//Weg 1
      kraftWegConn2.f = -kraftWegConn1.f;
//Weg 2
//kraftWegConn2.f = c * (l_0-(kraftWegConn1.s - kraftWegConn2.s));
      annotation(
        Icon(graphics = {Line(origin = {0, 10}, points = {{0, 70}, {-40, 70}, {40, 30}, {-40, 30}, {40, -10}, {-40, -10}, {40, -50}, {-40, -50}, {0, -70}}, thickness = 2)}, coordinateSystem(extent = {{-40, -65}, {40, 85}})),
  Diagram(coordinateSystem(extent = {{-40, -65}, {40, 85}})));
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

    model Daempfer
      parameter Modelica.Units.SI.TranslationalDampingConstant d = 0.5 "Federkonstante";
      Connectoren.KraftWegConn kraftWegConn1 annotation(
        Placement(visible = true, transformation(origin = {0, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Connectoren.KraftWegConn kraftWegConn2 annotation(
        Placement(visible = true, transformation(origin = {0, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      kraftWegConn1.f = d*((der(kraftWegConn1.s) - der(kraftWegConn2.s)));
//Hier sind nun zwei Wege mgölich um die Kraft für kraftWegConn2 anzugeben (es muss immer ein Weg auskommentiert sein)
//Weg 1
      kraftWegConn2.f = -kraftWegConn1.f;
//Weg 2
//kraftWegConn2.f = c * -(der(kraftWegConn1.s) - der(kraftWegConn2.s)));
      annotation(
        Icon(graphics = {Rectangle(origin = {1, -34}, fillColor = {214, 214, 214}, fillPattern = FillPattern.Solid, extent = {{-21, 26}, {21, -26}}), Line(origin = {0, 36}, points = {{0, 44}, {0, -44}}, thickness = 1.5), Line(origin = {1, -10}, points = {{-21, 50}, {-21, -50}, {21, -50}, {21, 50}}, thickness = 1.5), Line(origin = {0.18, -8.15915}, points = {{-16, 0}, {16, 0}}, thickness = 1.5)}, coordinateSystem(extent = {{-25, -65}, {25, 85}})),
  Diagram(coordinateSystem(extent = {{-25, -65}, {25, 85}})));
    end Daempfer;
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
    model MasseDeckeSystem
      FMDS.Komponenten.Decke decke annotation(
        Placement(visible = true, transformation(origin = {-1.90735e-06, 77.6}, extent = {{-87, -17.4}, {87, 17.4}}, rotation = 0)));
      FMDS.Komponenten.Masse masse annotation(
        Placement(visible = true, transformation(origin = {1, 1}, extent = {{-21, -21}, {21, 21}}, rotation = 0)));
    equation
      connect(decke.kraftWegConn, masse.kraftWegConn) annotation(
        Line(points = {{0, 68}, {0, 19}, {1, 19}, {1, 17}}));
    end MasseDeckeSystem;

    model FMS
      FMDS.Komponenten.Decke decke annotation(
        Placement(visible = true, transformation(origin = {0, 79.2}, extent = {{-94, -18.8}, {94, 18.8}}, rotation = 0)));
      FMDS.Komponenten.Feder feder annotation(
        Placement(visible = true, transformation(origin = {1, 19}, extent = {{-31, -31}, {31, 31}}, rotation = 0)));
      FMDS.Komponenten.Masse masse annotation(
        Placement(visible = true, transformation(origin = {1, -54.25}, extent = {{-15, -15}, {15, 18.75}}, rotation = 0)));
    initial equation
      masse.a = 0;
    equation
      connect(feder.kraftWegConn1, decke.kraftWegConn) annotation(
        Line(points = {{2, 44}, {0, 44}, {0, 70}}));
      connect(masse.kraftWegConn, feder.kraftWegConn2) annotation(
        Line(points = {{2, -40}, {2, 0}}));
    end FMS;

    model FederMasseDaempferSystem
  FMDS.Komponenten.Masse masse annotation(
        Placement(visible = true, transformation(origin = {0.888889, -81.1111}, extent = {{-14.8889, -14.8889}, {14.8889, 18.6111}}, rotation = 0)));
  FMDS.Komponenten.Feder feder annotation(
        Placement(visible = true, transformation(origin = {-24, 1.375}, extent = {{-17, -27.625}, {17, 36.125}}, rotation = 0)));
  FMDS.Komponenten.Decke decke annotation(
        Placement(visible = true, transformation(origin = {-1, 73.8}, extent = {{-101, -20.2}, {101, 20.2}}, rotation = 0)));
  FMDS.Komponenten.Daempfer daempfer(d = 2)  annotation(
        Placement(visible = true, transformation(origin = {21, 3.4}, extent = {{-11.5, -29.9}, {11.5, 39.1}}, rotation = 0)));
    equation
  connect(daempfer.kraftWegConn1, decke.kraftWegConn) annotation(
        Line(points = {{22, 40}, {0, 40}, {0, 64}}));
  connect(feder.kraftWegConn1, decke.kraftWegConn) annotation(
        Line(points = {{-24, 36}, {0, 36}, {0, 64}}));
  connect(masse.kraftWegConn, daempfer.kraftWegConn2) annotation(
        Line(points = {{0, -66}, {0, -38}, {22, -38}, {22, -24}}));
  connect(feder.kraftWegConn2, masse.kraftWegConn) annotation(
        Line(points = {{-24, -24}, {0, -24}, {0, -66}}));
    annotation(
        Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
end FederMasseDaempferSystem;
  end Tests;
end FMDS;
