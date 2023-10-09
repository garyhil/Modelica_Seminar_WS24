model Temperature_Connectors
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor(C = 500, T(start = 303.15))  annotation(
    Placement(visible = true, transformation(origin = {-70, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor1(C = 500, T(start = 283.15))  annotation(
    Placement(visible = true, transformation(origin = {46, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(G = 75)  annotation(
    Placement(visible = true, transformation(origin = {-6, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(heatCapacitor1.port, thermalConductor.port_b) annotation(
    Line(points = {{46, 24}, {46, 2}, {4, 2}}, color = {191, 0, 0}));
  connect(thermalConductor.port_a, heatCapacitor.port) annotation(
    Line(points = {{-16, 2}, {-70, 2}, {-70, 24}}, color = {191, 0, 0}));

annotation(
    uses(Modelica(version = "4.0.0")),
  experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-6, Interval = 0.002));
end Temperature_Connectors;
