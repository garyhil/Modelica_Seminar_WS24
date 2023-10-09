package externe_Bloecke
  model Windrad_Code
    parameter Modelica.Electrical.Machines.Utilities.ParameterRecords.DcPermanentMagnetData dcpmData(frictionParameters = frictionParameters)  annotation(
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
  Modelica.Mechanics.Rotational.Components.Brake brake(fn_max = 6)  annotation(
      Placement(visible = true, transformation(origin = {-38, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor annotation(
      Placement(visible = true, transformation(origin = {-80, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation(
      Placement(visible = true, transformation(origin = {72, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 1, startTime = 5)  annotation(
      Placement(visible = true, transformation(origin = {-66, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Electrical.Machines.Losses.FrictionParameters frictionParameters(PRef = 800, wRef = 157.0796326794897)  annotation(
      Placement(visible = true, transformation(origin = {-110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
      Line(points = {{-55, 36}, {-55, -29}, {-38, -29}}, color = {0, 0, 127}));
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
  annotation(
    uses(Modelica(version = "4.0.0")));
end externe_Bloecke;
