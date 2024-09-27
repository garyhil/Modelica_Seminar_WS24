model Tanksystem_Connectors
  inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial) annotation(
    Placement(visible = true, transformation(origin = {-8, 10}, extent = {{60, 60}, {80, 80}}, rotation = 0)));
  Modelica.Fluid.Vessels.OpenTank tank2(redeclare package Medium = Modelica.Media.Water.StandardWater, crossArea = (1^2)*0.25*Modelica.Constants.pi, height = 6, level_start = 2, nPorts = 1, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.2, height = 0.0, zeta_in = 0.5, zeta_out = 0.5)}, use_Re = false, use_portsData = true) annotation(
    Placement(visible = true, transformation(origin = {-54, 90}, extent = {{0, -80}, {40, -40}}, rotation = 0)));
  Modelica.Fluid.Vessels.OpenTank tank1(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater, crossArea = 1^2*0.25*Modelica.Constants.pi, height = 6, level_start = 5, nPorts = 1, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.2, height = 0.0, zeta_in = 0.5, zeta_out = 0.5)}, use_portsData = true) annotation(
    Placement(visible = true, transformation(origin = {58, -10}, extent = {{-40, 20}, {0, 60}}, rotation = 0)));
equation
  connect(tank1.ports[1], tank2.ports[1]) annotation(
    Line(points = {{38, 10}, {38, -22}, {-34, -22}, {-34, 10}}, color = {0, 127, 255}));
  annotation(
    uses(Modelica(version = "4.0.0")),
    experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-06, Interval = 0.01));
end Tanksystem_Connectors;
