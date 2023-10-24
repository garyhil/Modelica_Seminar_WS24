model Tanksystem_Code

parameter Real p_amb = 101325;
parameter Real d1 = 1.0;
parameter Real d2 = 1.0;
parameter Real A1 = 0.25 * d1^2 * Modelica.Constants.pi;
parameter Real A2 = 0.25 * d2^2 * Modelica.Constants.pi;
parameter Real A1_out = 0.25 * d1_out^2 * Modelica.Constants.pi;
parameter Real A2_out = 0.25 * d2_out^2 * Modelica.Constants.pi;
parameter Real d1_out = 0.2;
parameter Real d2_out = 0.2;
parameter Real rho = 997;
parameter Real g = Modelica.Constants.g_n;

Real l1(start = 5.0);
Real V1;
Real c1;
Real p1;
Real m1;
Real l2(start = 2.0);
Real V2;
Real c2;
Real p2;
Real m2;

equation
V1 = l1*A1;
V2 = l2*A2;
p1 = rho * g * l1+p_amb + 0.5 * rho * c1^2;
p2 = rho * g * l2+p_amb + 0.5 * rho * c2^2;
m1 = c1 * A1_out * rho;
m2 = c2 * A2_out * rho;
der(V1) = -m1/rho;
der(V2) = -m2/rho;
der(V1) + der(V2) = 0;
//c1 = sqrt(2*g*(l1-l2));

//when l1-l2<0 then
//  c1 = 0;
//end when;
//c1 = if l1-l2>=0 then sqrt(2*g*(l1-l2)) else 0;
c1 = if noEvent(l1-l2>=0) then sqrt(2*g*(l1-l2)) else 0;

annotation(
    experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-6, Interval = 0.01));
end Tanksystem_Code;
