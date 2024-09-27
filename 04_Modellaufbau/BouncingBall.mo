model BouncingBall
  Modelica.Units.SI.Height h;
  Modelica.Units.SI.Velocity v(start=0.0, fixed=true);
  Boolean done "Flag when to turn off gravity";
  parameter Real e = 0.8 "Rückstoßkoeffizient";
  parameter Real h_0 = 1.0 "Starthöhe";
  
  constant Real eps = 1e-3 "Minimum Height to reach to continue bouncing";
initial equation 
  h = h_0;
equation
  v = der(h);
  der(v) = if done then 0 else -9.81;
  when {h<0,h<-eps} then
    done = h<-eps;
    reinit(v, -e*(if h<-eps then 0 else pre(v)));
  end when;
annotation(
    experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-6, Interval = 0.0002));
end BouncingBall;
