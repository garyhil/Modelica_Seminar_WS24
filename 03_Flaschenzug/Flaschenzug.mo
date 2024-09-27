package Flaschenzug
  model Flaschenzug_Fall01
    Flaschenzug.Components.Decke decke annotation(
      Placement(visible = true, transformation(origin = {1, 79}, extent = {{-75, -15}, {75, 15}}, rotation = 0)));
    Flaschenzug.Components.Masse masse annotation(
      Placement(visible = true, transformation(origin = {-36, -58}, extent = {{-24, -24}, {24, 24}}, rotation = 0)));
    Flaschenzug.Components.Seil seil annotation(
      Placement(visible = true, transformation(origin = {-34.8, -2}, extent = {{-9.2, -46}, {9.2, 46}}, rotation = 0)));
    Flaschenzug.Components.Seil seil1 annotation(
      Placement(visible = true, transformation(origin = {38.2, -5}, extent = {{-10.2, -51}, {10.2, 51}}, rotation = 0)));
    Flaschenzug.Components.Umlenkrolle umlenkrolle annotation(
      Placement(visible = true, transformation(origin = {1, 41}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
    Flaschenzug.Components.Hand hand(flange_a.s = 0) annotation(
      Placement(visible = true, transformation(origin = {59, -77}, extent = {{-21, -21}, {21, 21}}, rotation = 0)));
  equation
    connect(masse.flange_a, seil.flange_u) annotation(
      Line(points = {{-36, -49}, {-36, -54}, {-35, -54}, {-35, -41}}, color = {0, 127, 0}));
    connect(seil.flange_o, umlenkrolle.flange_l) annotation(
      Line(points = {{-35, 38}, {-35, 42}, {-14, 42}}, color = {0, 127, 0}));
    connect(umlenkrolle.flange_m, decke.flange_a) annotation(
      Line(points = {{2, 42}, {2, 80}}, color = {0, 127, 0}));
    connect(umlenkrolle.flange_r, seil1.flange_o) annotation(
      Line(points = {{18, 42}, {38, 42}, {38, 38}}, color = {0, 127, 0}));
    connect(hand.flange_a, seil1.flange_u) annotation(
      Line(points = {{60, -76}, {38, -76}, {38, -48}}, color = {0, 127, 0}));
    annotation(
      Diagram(graphics = {Text(origin = {-83, 86}, extent = {{-13, 16}, {13, -16}}, textString = "Fall 01")}),
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.002));
  end Flaschenzug_Fall01;

  model Flaschenzug_Fall02
    Flaschenzug.Components.Decke decke annotation(
      Placement(visible = true, transformation(origin = {1, 79}, extent = {{-75, -15}, {75, 15}}, rotation = 0)));
    Flaschenzug.Components.Masse masse annotation(
      Placement(visible = true, transformation(origin = {-34, -74}, extent = {{-24, -24}, {24, 24}}, rotation = 0)));
    Flaschenzug.Components.Seil seil annotation(
      Placement(visible = true, transformation(origin = {-34.8, -2}, extent = {{-9.2, -46}, {9.2, 46}}, rotation = 0)));
    Flaschenzug.Components.Seil seil1 annotation(
      Placement(visible = true, transformation(origin = {38.2, -5}, extent = {{-10.2, -51}, {10.2, 51}}, rotation = 0)));
    Flaschenzug.Components.Umlenkrolle umlenkrolle annotation(
      Placement(visible = true, transformation(origin = {1, 41}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
    Flaschenzug.Components.Hand hand(flange_a.s = 1) annotation(
      Placement(visible = true, transformation(origin = {59, -77}, extent = {{-21, -21}, {21, 21}}, rotation = 0)));
  equation
    connect(masse.flange_a, seil.flange_u) annotation(
      Line(points = {{-34, -65}, {-34, -54}, {-35, -54}, {-35, -41}}, color = {0, 127, 0}));
    connect(seil.flange_o, umlenkrolle.flange_l) annotation(
      Line(points = {{-35, 38}, {-35, 42}, {-14, 42}}, color = {0, 127, 0}));
    connect(umlenkrolle.flange_m, decke.flange_a) annotation(
      Line(points = {{2, 42}, {2, 80}}, color = {0, 127, 0}));
    connect(umlenkrolle.flange_r, seil1.flange_o) annotation(
      Line(points = {{18, 42}, {38, 42}, {38, 38}}, color = {0, 127, 0}));
    connect(hand.flange_a, seil1.flange_u) annotation(
      Line(points = {{60, -76}, {38, -76}, {38, -48}}, color = {0, 127, 0}));
    annotation(
      Diagram(graphics = {Text(origin = {-83, 86}, extent = {{-13, 16}, {13, -16}}, textString = "Fall 02")}),
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.002));
  end Flaschenzug_Fall02;

  model Flaschenzug_Fall03
    Flaschenzug.Components.Decke decke annotation(
      Placement(visible = true, transformation(origin = {1, 79}, extent = {{-75, -15}, {75, 15}}, rotation = 0)));
    Flaschenzug.Components.Masse masse annotation(
      Placement(visible = true, transformation(origin = {-34, -74}, extent = {{-24, -24}, {24, 24}}, rotation = 0)));
    Flaschenzug.Components.Seil seil annotation(
      Placement(visible = true, transformation(origin = {-34.8, -2}, extent = {{-9.2, -46}, {9.2, 46}}, rotation = 0)));
    Flaschenzug.Components.Seil seil1 annotation(
      Placement(visible = true, transformation(origin = {38.2, -5}, extent = {{-10.2, -51}, {10.2, 51}}, rotation = 0)));
    Flaschenzug.Components.Umlenkrolle umlenkrolle annotation(
      Placement(visible = true, transformation(origin = {1, 41}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
    Flaschenzug.Components.Hand hand(v = 0) annotation(
      Placement(visible = true, transformation(origin = {59, -77}, extent = {{-21, -21}, {21, 21}}, rotation = 0)));
  equation
    connect(masse.flange_a, seil.flange_u) annotation(
      Line(points = {{-34, -65}, {-34, -54}, {-35, -54}, {-35, -41}}, color = {0, 127, 0}));
    connect(seil.flange_o, umlenkrolle.flange_l) annotation(
      Line(points = {{-35, 38}, {-35, 42}, {-14, 42}}, color = {0, 127, 0}));
    connect(umlenkrolle.flange_m, decke.flange_a) annotation(
      Line(points = {{2, 42}, {2, 80}}, color = {0, 127, 0}));
    connect(umlenkrolle.flange_r, seil1.flange_o) annotation(
      Line(points = {{18, 42}, {38, 42}, {38, 38}}, color = {0, 127, 0}));
    connect(hand.flange_a, seil1.flange_u) annotation(
      Line(points = {{60, -76}, {38, -76}, {38, -48}}, color = {0, 127, 0}));
    annotation(
      Diagram(graphics = {Text(origin = {-83, 86}, extent = {{-13, 16}, {13, -16}}, textString = "Fall 03")}),
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.002));
  end Flaschenzug_Fall03;

  model Flaschenzug_Fall04
    Flaschenzug.Components.Decke decke annotation(
      Placement(visible = true, transformation(origin = {1, 79}, extent = {{-75, -15}, {75, 15}}, rotation = 0)));
    Flaschenzug.Components.Masse masse annotation(
      Placement(visible = true, transformation(origin = {-34, -74}, extent = {{-24, -24}, {24, 24}}, rotation = 0)));
    Flaschenzug.Components.Seil seil annotation(
      Placement(visible = true, transformation(origin = {-34.8, -2}, extent = {{-9.2, -46}, {9.2, 46}}, rotation = 0)));
    Flaschenzug.Components.Seil seil1 annotation(
      Placement(visible = true, transformation(origin = {38.2, -5}, extent = {{-10.2, -51}, {10.2, 51}}, rotation = 0)));
    Flaschenzug.Components.Umlenkrolle umlenkrolle annotation(
      Placement(visible = true, transformation(origin = {1, 41}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
    Flaschenzug.Components.Hand hand(v = 10) annotation(
      Placement(visible = true, transformation(origin = {59, -77}, extent = {{-21, -21}, {21, 21}}, rotation = 0)));
  equation
    connect(masse.flange_a, seil.flange_u) annotation(
      Line(points = {{-34, -65}, {-34, -54}, {-35, -54}, {-35, -41}}, color = {0, 127, 0}));
    connect(seil.flange_o, umlenkrolle.flange_l) annotation(
      Line(points = {{-35, 38}, {-35, 42}, {-14, 42}}, color = {0, 127, 0}));
    connect(umlenkrolle.flange_m, decke.flange_a) annotation(
      Line(points = {{2, 42}, {2, 80}}, color = {0, 127, 0}));
    connect(umlenkrolle.flange_r, seil1.flange_o) annotation(
      Line(points = {{18, 42}, {38, 42}, {38, 38}}, color = {0, 127, 0}));
    connect(hand.flange_a, seil1.flange_u) annotation(
      Line(points = {{60, -76}, {38, -76}, {38, -48}}, color = {0, 127, 0}));
    annotation(
      Diagram(graphics = {Text(origin = {-83, 86}, extent = {{-13, 16}, {13, -16}}, textString = "Fall 04")}),
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.002));
  end Flaschenzug_Fall04;

  model Flaschenzug_Fall05
    Flaschenzug.Components.Decke decke annotation(
      Placement(visible = true, transformation(origin = {1, 79}, extent = {{-75, -15}, {75, 15}}, rotation = 0)));
    Flaschenzug.Components.Masse masse annotation(
      Placement(visible = true, transformation(origin = {-34, -74}, extent = {{-24, -24}, {24, 24}}, rotation = 0)));
    Flaschenzug.Components.Seil seil annotation(
      Placement(visible = true, transformation(origin = {-34.8, -2}, extent = {{-9.2, -46}, {9.2, 46}}, rotation = 0)));
    Flaschenzug.Components.Seil seil1 annotation(
      Placement(visible = true, transformation(origin = {38.2, -5}, extent = {{-10.2, -51}, {10.2, 51}}, rotation = 0)));
    Flaschenzug.Components.Umlenkrolle umlenkrolle annotation(
      Placement(visible = true, transformation(origin = {1, 41}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
    Flaschenzug.Components.Hand hand(v = 5*time) annotation(
      Placement(visible = true, transformation(origin = {59, -77}, extent = {{-21, -21}, {21, 21}}, rotation = 0)));
  equation
    connect(masse.flange_a, seil.flange_u) annotation(
      Line(points = {{-34, -65}, {-34, -54}, {-35, -54}, {-35, -41}}, color = {0, 127, 0}));
    connect(seil.flange_o, umlenkrolle.flange_l) annotation(
      Line(points = {{-35, 38}, {-35, 42}, {-14, 42}}, color = {0, 127, 0}));
    connect(umlenkrolle.flange_m, decke.flange_a) annotation(
      Line(points = {{2, 42}, {2, 80}}, color = {0, 127, 0}));
    connect(umlenkrolle.flange_r, seil1.flange_o) annotation(
      Line(points = {{18, 42}, {38, 42}, {38, 38}}, color = {0, 127, 0}));
    connect(hand.flange_a, seil1.flange_u) annotation(
      Line(points = {{60, -76}, {38, -76}, {38, -48}}, color = {0, 127, 0}));
    annotation(
      Diagram(graphics = {Text(origin = {-83, 86}, extent = {{-13, 16}, {13, -16}}, textString = "Fall 05")}),
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.002));
  end Flaschenzug_Fall05;

  model Flaschenzug_Fall06
    Flaschenzug.Components.Decke decke annotation(
      Placement(visible = true, transformation(origin = {1, 79}, extent = {{-75, -15}, {75, 15}}, rotation = 0)));
    Flaschenzug.Components.Masse masse annotation(
      Placement(visible = true, transformation(origin = {-34, -74}, extent = {{-24, -24}, {24, 24}}, rotation = 0)));
    Flaschenzug.Components.Seil seil annotation(
      Placement(visible = true, transformation(origin = {-34.8, -2}, extent = {{-9.2, -46}, {9.2, 46}}, rotation = 0)));
    Flaschenzug.Components.Seil seil1 annotation(
      Placement(visible = true, transformation(origin = {38.2, -5}, extent = {{-10.2, -51}, {10.2, 51}}, rotation = 0)));
    Flaschenzug.Components.Umlenkrolle umlenkrolle annotation(
      Placement(visible = true, transformation(origin = {1, 41}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
    Flaschenzug.Components.Hand hand(a = -10) annotation(
      Placement(visible = true, transformation(origin = {59, -77}, extent = {{-21, -21}, {21, 21}}, rotation = 0)));
  equation
    connect(masse.flange_a, seil.flange_u) annotation(
      Line(points = {{-34, -65}, {-34, -54}, {-35, -54}, {-35, -41}}, color = {0, 127, 0}));
    connect(seil.flange_o, umlenkrolle.flange_l) annotation(
      Line(points = {{-35, 38}, {-35, 42}, {-14, 42}}, color = {0, 127, 0}));
    connect(umlenkrolle.flange_m, decke.flange_a) annotation(
      Line(points = {{2, 42}, {2, 80}}, color = {0, 127, 0}));
    connect(umlenkrolle.flange_r, seil1.flange_o) annotation(
      Line(points = {{18, 42}, {38, 42}, {38, 38}}, color = {0, 127, 0}));
    connect(hand.flange_a, seil1.flange_u) annotation(
      Line(points = {{60, -76}, {38, -76}, {38, -48}}, color = {0, 127, 0}));
    annotation(
      Diagram(graphics = {Text(origin = {-83, 86}, extent = {{-13, 16}, {13, -16}}, textString = "Fall 06")}),
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.002));
  end Flaschenzug_Fall06;

  model Flaschenzug_Fall07
    Flaschenzug.Components.Decke decke annotation(
      Placement(visible = true, transformation(origin = {1, 79}, extent = {{-75, -15}, {75, 15}}, rotation = 0)));
    Flaschenzug.Components.Masse masse annotation(
      Placement(visible = true, transformation(origin = {-34, -74}, extent = {{-24, -24}, {24, 24}}, rotation = 0)));
    Flaschenzug.Components.Seil seil annotation(
      Placement(visible = true, transformation(origin = {-34.8, -2}, extent = {{-9.2, -46}, {9.2, 46}}, rotation = 0)));
    Flaschenzug.Components.Seil seil1 annotation(
      Placement(visible = true, transformation(origin = {38.2, -5}, extent = {{-10.2, -51}, {10.2, 51}}, rotation = 0)));
    Flaschenzug.Components.Umlenkrolle umlenkrolle annotation(
      Placement(visible = true, transformation(origin = {1, 41}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
    Flaschenzug.Components.Hand hand(flange_a.f = 0) annotation(
      Placement(visible = true, transformation(origin = {59, -77}, extent = {{-21, -21}, {21, 21}}, rotation = 0)));
  equation
    connect(masse.flange_a, seil.flange_u) annotation(
      Line(points = {{-34, -65}, {-34, -54}, {-35, -54}, {-35, -41}}, color = {0, 127, 0}));
    connect(seil.flange_o, umlenkrolle.flange_l) annotation(
      Line(points = {{-35, 38}, {-35, 42}, {-14, 42}}, color = {0, 127, 0}));
    connect(umlenkrolle.flange_m, decke.flange_a) annotation(
      Line(points = {{2, 42}, {2, 80}}, color = {0, 127, 0}));
    connect(umlenkrolle.flange_r, seil1.flange_o) annotation(
      Line(points = {{18, 42}, {38, 42}, {38, 38}}, color = {0, 127, 0}));
    connect(hand.flange_a, seil1.flange_u) annotation(
      Line(points = {{60, -76}, {38, -76}, {38, -48}}, color = {0, 127, 0}));
    annotation(
      Diagram(graphics = {Text(origin = {-83, 86}, extent = {{-13, 16}, {13, -16}}, textString = "Fall 07")}),
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.002));
  end Flaschenzug_Fall07;

  model Flaschenzug_Fall08
    Flaschenzug.Components.Decke decke annotation(
      Placement(visible = true, transformation(origin = {1, 79}, extent = {{-75, -15}, {75, 15}}, rotation = 0)));
    Flaschenzug.Components.Masse masse annotation(
      Placement(visible = true, transformation(origin = {-34, -74}, extent = {{-24, -24}, {24, 24}}, rotation = 0)));
    Flaschenzug.Components.Seil seil annotation(
      Placement(visible = true, transformation(origin = {-34.8, -2}, extent = {{-9.2, -46}, {9.2, 46}}, rotation = 0)));
    Flaschenzug.Components.Seil seil1 annotation(
      Placement(visible = true, transformation(origin = {38.2, -5}, extent = {{-10.2, -51}, {10.2, 51}}, rotation = 0)));
    Flaschenzug.Components.Umlenkrolle umlenkrolle annotation(
      Placement(visible = true, transformation(origin = {1, 41}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
    Flaschenzug.Components.Hand hand(flange_a.f = 1) annotation(
      Placement(visible = true, transformation(origin = {59, -77}, extent = {{-21, -21}, {21, 21}}, rotation = 0)));
  equation
    connect(masse.flange_a, seil.flange_u) annotation(
      Line(points = {{-34, -65}, {-34, -54}, {-35, -54}, {-35, -41}}, color = {0, 127, 0}));
    connect(seil.flange_o, umlenkrolle.flange_l) annotation(
      Line(points = {{-35, 38}, {-35, 42}, {-14, 42}}, color = {0, 127, 0}));
    connect(umlenkrolle.flange_m, decke.flange_a) annotation(
      Line(points = {{2, 42}, {2, 80}}, color = {0, 127, 0}));
    connect(umlenkrolle.flange_r, seil1.flange_o) annotation(
      Line(points = {{18, 42}, {38, 42}, {38, 38}}, color = {0, 127, 0}));
    connect(hand.flange_a, seil1.flange_u) annotation(
      Line(points = {{60, -76}, {38, -76}, {38, -48}}, color = {0, 127, 0}));
    annotation(
      Diagram(graphics = {Text(origin = {-83, 86}, extent = {{-13, 16}, {13, -16}}, textString = "Fall 08")}),
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.002));
  end Flaschenzug_Fall08;

  model Flaschenzug_Fall09
    Flaschenzug.Components.Decke decke annotation(
      Placement(visible = true, transformation(origin = {1, 79}, extent = {{-75, -15}, {75, 15}}, rotation = 0)));
    Flaschenzug.Components.Masse masse annotation(
      Placement(visible = true, transformation(origin = {-34, -74}, extent = {{-24, -24}, {24, 24}}, rotation = 0)));
    Flaschenzug.Components.Seil seil annotation(
      Placement(visible = true, transformation(origin = {-34.8, -2}, extent = {{-9.2, -46}, {9.2, 46}}, rotation = 0)));
    Flaschenzug.Components.Seil seil1 annotation(
      Placement(visible = true, transformation(origin = {38.2, -5}, extent = {{-10.2, -51}, {10.2, 51}}, rotation = 0)));
    Flaschenzug.Components.Umlenkrolle umlenkrolle annotation(
      Placement(visible = true, transformation(origin = {1, 41}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
    Flaschenzug.Components.Hand hand(flange_a.f = 51) annotation(
      Placement(visible = true, transformation(origin = {59, -77}, extent = {{-21, -21}, {21, 21}}, rotation = 0)));
  equation
    connect(masse.flange_a, seil.flange_u) annotation(
      Line(points = {{-34, -65}, {-34, -54}, {-35, -54}, {-35, -41}}, color = {0, 127, 0}));
    connect(seil.flange_o, umlenkrolle.flange_l) annotation(
      Line(points = {{-35, 38}, {-35, 42}, {-14, 42}}, color = {0, 127, 0}));
    connect(umlenkrolle.flange_m, decke.flange_a) annotation(
      Line(points = {{2, 42}, {2, 80}}, color = {0, 127, 0}));
    connect(umlenkrolle.flange_r, seil1.flange_o) annotation(
      Line(points = {{18, 42}, {38, 42}, {38, 38}}, color = {0, 127, 0}));
    connect(hand.flange_a, seil1.flange_u) annotation(
      Line(points = {{60, -76}, {38, -76}, {38, -48}}, color = {0, 127, 0}));
    annotation(
      Diagram(graphics = {Text(origin = {-83, 86}, extent = {{-13, 16}, {13, -16}}, textString = "Fall 09")}),
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.002));
  end Flaschenzug_Fall09;

  model Flaschenzug_Fall10
    Flaschenzug.Components.Decke decke annotation(
      Placement(visible = true, transformation(origin = {1, 79}, extent = {{-75, -15}, {75, 15}}, rotation = 0)));
    Flaschenzug.Components.Masse masse annotation(
      Placement(visible = true, transformation(origin = {-34, -74}, extent = {{-24, -24}, {24, 24}}, rotation = 0)));
    Flaschenzug.Components.Seil seil annotation(
      Placement(visible = true, transformation(origin = {-34.8, -2}, extent = {{-9.2, -46}, {9.2, 46}}, rotation = 0)));
    Flaschenzug.Components.Seil seil1 annotation(
      Placement(visible = true, transformation(origin = {38.2, -5}, extent = {{-10.2, -51}, {10.2, 51}}, rotation = 0)));
    Flaschenzug.Components.Umlenkrolle umlenkrolle annotation(
      Placement(visible = true, transformation(origin = {1, 41}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
    Flaschenzug.Components.Hand hand(flange_a.f = -10*time) annotation(
      Placement(visible = true, transformation(origin = {59, -77}, extent = {{-21, -21}, {21, 21}}, rotation = 0)));
  equation
    connect(masse.flange_a, seil.flange_u) annotation(
      Line(points = {{-34, -65}, {-34, -54}, {-35, -54}, {-35, -41}}, color = {0, 127, 0}));
    connect(seil.flange_o, umlenkrolle.flange_l) annotation(
      Line(points = {{-35, 38}, {-35, 42}, {-14, 42}}, color = {0, 127, 0}));
    connect(umlenkrolle.flange_m, decke.flange_a) annotation(
      Line(points = {{2, 42}, {2, 80}}, color = {0, 127, 0}));
    connect(umlenkrolle.flange_r, seil1.flange_o) annotation(
      Line(points = {{18, 42}, {38, 42}, {38, 38}}, color = {0, 127, 0}));
    connect(hand.flange_a, seil1.flange_u) annotation(
      Line(points = {{60, -76}, {38, -76}, {38, -48}}, color = {0, 127, 0}));
    annotation(
      Diagram(graphics = {Text(origin = {-83, 86}, extent = {{-13, 16}, {13, -16}}, textString = "Fall 10")}),
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.002));
  end Flaschenzug_Fall10;

  package Components
    model Decke
      Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a annotation(
        Placement(visible = true, transformation(origin = {2, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {2, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      parameter Modelica.Units.SI.Height height = 0;
    equation
      flange_a.s = height;
      annotation(
        Icon(graphics = {Rectangle(origin = {-2, 10}, fillPattern = FillPattern.Solid, extent = {{-90, 10}, {90, -10}})}, coordinateSystem(extent = {{-100, -20}, {100, 20}})),
        Diagram(coordinateSystem(extent = {{-100, -20}, {100, 20}})));
    end Decke;

    model Seil
      Modelica.Mechanics.Translational.Interfaces.Flange_a flange_o annotation(
        Placement(visible = true, transformation(origin = {2, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-1.33227e-15, 86}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
      Modelica.Mechanics.Translational.Interfaces.Flange_b flange_u annotation(
        Placement(visible = true, transformation(origin = {2, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {1.33227e-15, -84}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    equation
      flange_o.f + flange_u.f = 0;
      flange_o.s = flange_u.s;
      annotation(
        Icon(graphics = {Rectangle(origin = {0, -1}, fillColor = {194, 194, 26}, fillPattern = FillPattern.Backward, extent = {{-12, 79}, {12, -79}})}, coordinateSystem(extent = {{-20, -100}, {20, 100}})),
        Diagram(coordinateSystem(extent = {{-20, -100}, {20, 100}})));
    end Seil;

    model Masse
      constant Real g = -10;
      parameter Modelica.Units.SI.Mass mass = 5;
      Modelica.Units.SI.Velocity velocity;
      Modelica.Units.SI.Acceleration acceleration;
      Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a annotation(
        Placement(visible = true, transformation(origin = {0, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      der(velocity) = acceleration;
      der(flange_a.s) = velocity;
      mass*acceleration = mass*g - flange_a.f;
      annotation(
        Icon(graphics = {Ellipse(origin = {2, -20}, fillPattern = FillPattern.Solid, extent = {{-62, 62}, {62, -62}})}));
    end Masse;

    model Umlenkrolle
      Modelica.Mechanics.Translational.Interfaces.Flange_a flange_l annotation(
        Placement(visible = true, transformation(origin = {-62, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-62, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Translational.Interfaces.Flange_a flange_r annotation(
        Placement(visible = true, transformation(origin = {66, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {66, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Translational.Interfaces.Flange_a flange_m annotation(
        Placement(visible = true, transformation(origin = {4, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {6, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      flange_l.f + flange_r.f + flange_m.f = 0;
      flange_r.f = flange_l.f;
      flange_r.s + flange_l.s = 2*flange_m.s;
      annotation(
        Icon(graphics = {Ellipse(origin = {2, -3}, fillColor = {193, 193, 193}, fillPattern = FillPattern.Solid, extent = {{-62, 59}, {62, -59}})}));
    end Umlenkrolle;

    model Hand
      Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a annotation(
        Placement(visible = true, transformation(origin = {0, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Real a;
      Real v;
    equation
      der(flange_a.s) = v;
      der(v) = a;
      annotation(
        Icon(graphics = {Ellipse(origin = {-12, -5}, fillColor = {186, 186, 186}, fillPattern = FillPattern.Solid, extent = {{-52, 47}, {52, -47}}), Rectangle(origin = {71, -5}, fillColor = {204, 204, 204}, fillPattern = FillPattern.Solid, extent = {{47, 31}, {-47, -31}})}));
    end Hand;
  end Components;
  annotation(
    uses(Modelica(version = "4.0.0")));
end Flaschenzug;
