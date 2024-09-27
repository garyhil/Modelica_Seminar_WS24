model HysteresisControl "A control strategy that doesn't chatter"
  type HeatCapacitance = Real(unit = "J/K");
  type Temperature = Real(unit = "K");
  type Heat = Real(unit = "W");
  type Mass = Real(unit = "kg");
  type HeatTransferCoefficient = Real(unit = "W/K");
  parameter HeatCapacitance C = 1.0;
  parameter HeatTransferCoefficient h = 2.0;
  parameter Heat Qcapacity = 25.0;
  parameter Temperature Tamb = 285;
  parameter Temperature T_set = 295;
  Boolean heat(start = false) "Indicates whether heater is on";
  Real x(start = 1.0);
  Temperature T;
  Heat Q;
initial equation
  T = T_set + 5;
  heat = false;
  x = time;
equation
  Q = if heat then Qcapacity else 0;
  C*der(T) = Q - h*(T - Tamb);
  when T < T_set - 0.1 then
    heat = true;
    x = time;
  elsewhen T > T_set + 0.1 then
    heat = false;
    x = 3.0;
  end when;
  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.01));
end HysteresisControl;
