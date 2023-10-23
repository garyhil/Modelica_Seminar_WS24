package Test
    model Gewicht
        parameter Modelica.Units.SI.Mass masse = 5.0;

        Modelica.Units.SI.Acceleration  a;
        Modelica.Units.SI.Velocity      v;
        Modelica.Units.SI.Distance      s;

    equation
        der(v) = a;
        der(s) = v;
        m * a = m * -9.81;

    end Gewicht;

end Test;