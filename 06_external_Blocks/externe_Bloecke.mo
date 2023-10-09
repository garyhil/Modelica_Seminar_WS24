package externe_Bloecke
  model Windrad_Code
    parameter Modelica.Electrical.Machines.Utilities.ParameterRecords.DcPermanentMagnetData dcpmData annotation(
      Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-20, -80}, {0, -60}}, rotation = 0)));
    Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_PermanentMagnet dcpm(IaNominal = dcpmData.IaNominal, Jr = dcpmData.Jr, Js = dcpmData.Js, La = dcpmData.La, Ra = dcpmData.Ra, TaNominal = dcpmData.TaNominal, TaOperational = 293.15, TaRef = dcpmData.TaRef, VaNominal = dcpmData.VaNominal, alpha20a = dcpmData.alpha20a, brushParameters = dcpmData.brushParameters, coreParameters = dcpmData.coreParameters, frictionParameters = dcpmData.frictionParameters, ia(fixed = true), phiMechanical(fixed = true), strayLoadParameters = dcpmData.strayLoadParameters, useSupport = false, wMechanical(fixed = true), wNominal = dcpmData.wNominal) annotation(
      Placement(visible = true, transformation(origin = {-66, 0}, extent = {{-20, -50}, {0, -30}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Ground ground annotation(
      Placement(visible = true, transformation(origin = {-112, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
    Modelica.Mechanics.Rotational.Components.Inertia loadInertia(J = 50) annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{40, -50}, {60, -30}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Sources.TorqueStep loadTorqueStep(offsetTorque = 0, startTime = 1, stepTorque = 200, useSupport = false) annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{90, -50}, {70, -30}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.IdealGear idealGear(ratio = 25)  annotation(
      Placement(visible = true, transformation(origin = {-2, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed annotation(
      Placement(visible = true, transformation(origin = {-2, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Brake brake(fn_max = 16)  annotation(
      Placement(visible = true, transformation(origin = {-38, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor annotation(
      Placement(visible = true, transformation(origin = {-80, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation(
      Placement(visible = true, transformation(origin = {72, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 1, startTime = 3)  annotation(
      Placement(visible = true, transformation(origin = {-50, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(loadInertia.flange_b, loadTorqueStep.flange) annotation(
      Line(points = {{60, -40}, {70, -40}}));
    connect(idealGear.support, fixed.flange) annotation(
      Line(points = {{-2, -50}, {-2, -84}}));
    connect(brake.support, fixed.flange) annotation(
      Line(points = {{-38, -50}, {-38, -84}, {-2, -84}}));
    connect(voltageSensor.p, ground.p) annotation(
      Line(points = {{-90, -4}, {-102, -4}}, color = {0, 0, 255}));
    connect(speedSensor.flange, loadInertia.flange_b) annotation(
      Line(points = {{62, 10}, {60, 10}, {60, -40}}));
    connect(ramp.y, brake.f_normalized) annotation(
      Line(points = {{-39, 34}, {-39, -29}, {-38, -29}}, color = {0, 0, 127}));
    connect(idealGear.flange_b, loadInertia.flange_a) annotation(
      Line(points = {{8, -40}, {40, -40}}));
    connect(idealGear.flange_a, brake.flange_b) annotation(
      Line(points = {{-12, -40}, {-28, -40}}));
    connect(brake.flange_a, dcpm.flange) annotation(
      Line(points = {{-48, -40}, {-66, -40}}));
  connect(dcpm.pin_ap, voltageSensor.p) annotation(
      Line(points = {{-70, -30}, {-70, -24}, {-90, -24}, {-90, -4}}, color = {0, 0, 255}));
  connect(voltageSensor.n, dcpm.pin_an) annotation(
      Line(points = {{-70, -4}, {-70, -20}, {-82, -20}, {-82, -30}}, color = {0, 0, 255}));
    annotation(
      Diagram);end Windrad_Code;

  model Herd
    Modelica.Blocks.Sources.Step step(height=670, startTime=1, offset=293.15);
    Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature heizspirale(T= step.y);
    Herdplatte platte;
    Modelica.Thermal.HeatTransfer.Components.HeatCapacitor topf(C=500, T.start = 293.15);
   
   equation
    connect(platte.spiralseite, heizspirale.port);
    connect(platte.topfseite, topf.port);
  end Herd;
  
  model Herdplatte

Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a spiralseite;
Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a topfseite;
  equation
  connect(spiralseite,topfseite);
  end Herdplatte;

  model kkk
  Modelica.Blocks.Sources.Step step(height = 670, offset = 293.15, startTime = 1)  annotation(
      Placement(visible = true, transformation(origin = {-86, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature annotation(
      Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor(C = 500)  annotation(
      Placement(visible = true, transformation(origin = {52, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(G = 50)  annotation(
      Placement(visible = true, transformation(origin = {-2, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
  connect(step.y, prescribedTemperature.T) annotation(
      Line(points = {{-74, 0}, {-62, 0}}, color = {0, 0, 127}));
  connect(prescribedTemperature.port, thermalConductor.port_a) annotation(
      Line(points = {{-40, 0}, {-12, 0}, {-12, 2}}, color = {191, 0, 0}));
  connect(thermalConductor.port_b, heatCapacitor.port) annotation(
      Line(points = {{8, 2}, {32, 2}, {32, -24}, {52, -24}, {52, -10}}, color = {191, 0, 0}));
  end kkk;
  annotation(
    uses(Modelica(version = "4.0.0")));
end externe_Bloecke;
