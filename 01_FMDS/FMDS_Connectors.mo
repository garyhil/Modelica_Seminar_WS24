model FMDS_Connectors
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation(
    Placement(visible = true, transformation(origin = {-5, 73}, extent = {{11, 11}, {-11, -11}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Damper damper(d = 0.5) annotation(
    Placement(visible = true, transformation(origin = {12, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Translational.Components.Mass mass(m = 1) annotation(
    Placement(visible = true, transformation(origin = {-2, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Translational.Components.Spring spring(c = 50) annotation(
    Placement(visible = true, transformation(origin = {-16, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Translational.Sources.ConstantForce constantForce(f_constant = -9.81) annotation(
    Placement(visible = true, transformation(origin = {0, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(damper.flange_b, fixed.flange) annotation(
    Line(points = {{12, 72}, {-4, 72}, {-4, 74}}, color = {0, 127, 0}));
  connect(spring.flange_b, fixed.flange) annotation(
    Line(points = {{-16, 72}, {-10, 72}, {-10, 74}, {-4, 74}}, color = {0, 127, 0}));
  connect(mass.flange_b, damper.flange_a) annotation(
    Line(points = {{-2, 44}, {12, 44}, {12, 52}}, color = {0, 127, 0}));
  connect(mass.flange_b, spring.flange_a) annotation(
    Line(points = {{-2, 44}, {-16, 44}, {-16, 52}}, color = {0, 127, 0}));
  connect(constantForce.flange, mass.flange_a) annotation(
    Line(points = {{0, 6}, {0, 24}, {-2, 24}}, color = {0, 127, 0}));
  annotation(
    uses(Modelica(version = "4.0.0")),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
end FMDS_Connectors;
