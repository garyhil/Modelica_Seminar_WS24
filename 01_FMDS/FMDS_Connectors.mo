model FMDS_Connectors
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation(
    Placement(visible = true, transformation(origin = {-5, 73}, extent = {{11, 11}, {-11, -11}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Damper damper(d = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {8, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Translational.Components.Mass mass(m = 1)  annotation(
    Placement(visible = true, transformation(origin = {-2, 34}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Translational.Sources.Force force annotation(
    Placement(visible = true, transformation(origin = {-2, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Constant const(k = -9.81)  annotation(
    Placement(visible = true, transformation(origin = {-30, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Spring spring(c = 50)  annotation(
    Placement(visible = true, transformation(origin = {-14, 62}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(force.flange, mass.flange_b) annotation(
    Line(points = {{-2, 18}, {-2, 24}}, color = {0, 127, 0}));
  connect(const.y, force.f) annotation(
    Line(points = {{-19, -14}, {-1.5, -14}, {-1.5, -4}, {-2, -4}}, color = {0, 0, 127}));
  connect(spring.flange_a, fixed.flange) annotation(
    Line(points = {{-14, 72}, {-6, 72}, {-6, 74}, {-4, 74}}, color = {0, 127, 0}));
  connect(fixed.flange, damper.flange_b) annotation(
    Line(points = {{-4, 74}, {-5, 74}, {-5, 72}, {8, 72}}, color = {0, 127, 0}));
  connect(mass.flange_a, damper.flange_a) annotation(
    Line(points = {{-2, 44}, {8, 44}, {8, 52}}, color = {0, 127, 0}));
  connect(mass.flange_a, spring.flange_b) annotation(
    Line(points = {{-2, 44}, {-14, 44}, {-14, 52}}, color = {0, 127, 0}));
  annotation(
    uses(Modelica(version = "4.0.0")));
end FMDS_Connectors;
