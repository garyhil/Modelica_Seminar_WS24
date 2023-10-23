package Test
    model Gewicht
        constant Modelica.Units.SI.Acceleration g = -9.8065;

        parameter Modelica.Units.SI.Mass masse = 5.0;

        Modelica.Units.SI.Acceleration  a "Beschleunigung der Masse";
        Modelica.Units.SI.Velocity      v "Geschwindigkeit der Masse";
        Modelica.Units.SI.Distance      s "Weg der Masse";

    equation
        der(v) = a;     //Ableitung der Geschwindigkeit zu Beschleunigung
        der(s) = v;     //Ableitung des Weges zu Geschwindigkeit
        m * a = m * g;  //Bewegungsgleichung

    end Gewicht;

end Test;