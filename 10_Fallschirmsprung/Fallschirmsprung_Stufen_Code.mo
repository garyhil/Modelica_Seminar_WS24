package Fallschirmsprung_Stufen
  //Version 1

  package FallschirmBibliothek1
    model Fallschirmsprung1
      //Konstanten
      import Modelica.Constants.g_n;
      //Durchschnittliche Beschleunigung auf der Erde basierend auf der Gravitationskraft der Erde
      //Parameter
      //Variablen
      //Klassen
      FallschirmBibliothek1.Person person(name = "Harald", mass = 85);
      //Modelica-Blöcke
    equation
      person.acceleration * person.mass = person.mass * g_n;
      annotation(
        experiment(StartTime = 0, StopTime = 150, Tolerance = 1e-06, Interval = 0.01));
    end Fallschirmsprung1;

    class Person
      //Konstanten
      //Parameter
      parameter Modelica.Units.SI.Mass mass = 80;
      parameter String name = "Max MusterPerson";
      //Variablen
      Modelica.Units.SI.Acceleration acceleration;
      //Beschleunigung (des Schwerpunktes) der Person
      //Klassen
      //Modelica-Blöcke
    end Person;
    annotation(
      uses(Modelica(version = "4.0.0")));
  end FallschirmBibliothek1;

  //Version 2

  package FallschirmBibliothek2
    model Fallschirmsprung2
      //Konstanten
      import Modelica.Constants.g_n;
      //Durchschnittliche Beschleunigung aus der Erde basierend auf der Gravitationskraft der Erde
      //Parameter
      //Variablen
      //Klassen
      FallschirmBibliothek2.Person person(name = "Harald", mass = 85);
      //Modelica-Blöcke
    equation
      person.acceleration * person.mass = person.mass * g_n;
      annotation(
        experiment(StartTime = 0, StopTime = 150, Tolerance = 1e-06, Interval = 0.01));
    end Fallschirmsprung2;

    class Person
      //Konstanten
      //Parameter
      parameter Modelica.Units.SI.Mass mass = 80;
      parameter String name = "Max MustermPerson";
      //Variablen
      Modelica.Units.SI.Position position;
      //(vertikale) Position (des Schwerpunktes) der Person über dem Erdboden
      Modelica.Units.SI.Velocity velocity;
      //(vertikale) Geschwindigkeit (des Schwerpunktes) der Person gegenüber dem Erdboden
      Modelica.Units.SI.Acceleration acceleration;
      //(vertikale) Beschleunigung (des Schwerpunktes) der Person über dem Erdboden
      //Klassen
      //Modelica-Blöcke
    equation
      der(position) = velocity;
      der(velocity) = acceleration;
    end Person;
    annotation(
      uses(Modelica(version = "4.0.0")));
  end FallschirmBibliothek2;

  //Version 3

  package FallschirmBibliothek3
    model Fallschirmsprung3
      //Konstanten
      import Modelica.Constants.g_n;
      //Durchschnittliche Beschleunigung aus der Erde basierend auf der Gravitationskraft der Erde
      constant Modelica.Units.SI.Acceleration g_earth = -g_n;
      //Beschleunigung der Erde mit Bezugssystem
      //Parameter
      //Variablen
      //Klassen
      FallschirmBibliothek3.Person person(name = "Harald", mass = 85, position(start = flugzeug.height));
      FallschirmBibliothek3.Flugzeug flugzeug(height = 2000);
      //Modelica-Blöcke
    equation
      person.acceleration * person.mass = person.mass * g_earth;
      annotation(
        experiment(StartTime = 0, StopTime = 150, Tolerance = 1e-6, Interval = 0.01));
    end Fallschirmsprung3;

    class Person
      //Konstanten
      //Parameter
      parameter Modelica.Units.SI.Mass mass = 80;
      parameter String name = "Max MustermPerson";
      //Variablen
      Modelica.Units.SI.Position position;
      //(vertikale) Position (des Schwerpunktes) der Person über dem Erdboden
      Modelica.Units.SI.Velocity velocity;
      //(vertikale) Geschwindigkeit (des Schwerpunktes) der Person gegenüber dem Erdboden
      Modelica.Units.SI.Acceleration acceleration;
      //(vertikale) Beschleunigung (des Schwerpunktes) der Person über dem Erdboden
      //Klassen
      //Modelica-Blöcke
    equation
      der(position) = velocity;
      der(velocity) = acceleration;
    end Person;

    class Flugzeug
      //Konstanten
      //Parameter
      parameter Modelica.Units.SI.Height height = 2000;
      //Variablen
      //Klassen
      //Modelica-Blöcke
    end Flugzeug;
    annotation(
      uses(Modelica(version = "4.0.0")));
  end FallschirmBibliothek3;

  //Version 4

  package FallschirmBibliothek4
    model Fallschirmsprung4
      //Konstanten
      import Modelica.Constants.g_n;
      //Durchschnittliche Beschleunigung aus der Erde basierend auf der Gravitationskraft der Erde
      constant Modelica.Units.SI.Acceleration g_earth = -g_n;
      //Beschleunigung der Erde mit Bezugssystem
      //Parameter
      //Variablen
      //Klassen
      FallschirmBibliothek4.Person person(name = "Harald", mass = 85, position(start = flugzeug.height));
      FallschirmBibliothek4.Flugzeug flugzeug(height = 2000);
      //Modelica-Blöcke
    equation
      if noEvent(person.position > 0) then
        person.acceleration * person.mass = person.mass * g_earth;
      else
        person.acceleration = 0;
      end if;
      
      when time > 0 and person.acceleration == 0 then
        reinit(person.velocity, 0);
      end when;
    
      annotation(
        experiment(StartTime = 0, StopTime = 150, Tolerance = 1e-6, Interval = 0.01));
    end Fallschirmsprung4;

    class Person
      //Konstanten
      import Modelica.Constants.inf;
      //Parameter
      parameter Modelica.Units.SI.Mass mass = 80;
      parameter String name = "Max MustermPerson";
      //Variablen
      Modelica.Units.SI.Position position;
      //(vertikale) Position (des Schwerpunktes) der Person über dem Erdboden
      Modelica.Units.SI.Velocity velocity;
      //(vertikale) Geschwindigkeit (des Schwerpunktes) der Person gegenüber dem Erdboden
      Modelica.Units.SI.Acceleration acceleration;
      //(vertikale) Beschleunigung (des Schwerpunktes) der Person über dem Erdboden
      //Klassen
      //Modelica-Blöcke
    equation
      der(position) = velocity;
      der(velocity) = acceleration;
    end Person;

    class Flugzeug
      //Konstanten
      //Parameter
      parameter Modelica.Units.SI.Height height = 2000;
      //Variablen
      //Klassen
      //Modelica-Blöcke
    end Flugzeug;
    annotation(
      uses(Modelica(version = "4.0.0")));
  end FallschirmBibliothek4;

  //Version 5

  package FallschirmBibliothek5
    model Fallschirmsprung5
      //Konstanten
      import Modelica.Constants.g_n;
      //Durchschnittliche Beschleunigung aus der Erde basierend auf der Gravitationskraft der Erde
      constant Modelica.Units.SI.Acceleration g_earth = -g_n;
      //Beschleunigung der Erde mit Bezugssystem
      //Parameter
      parameter Modelica.Units.SI.Force F_g = person.mass * g_earth;
      //resultierende Graft durch die Gravitation des Planeten!
      //Variablen
      Modelica.Units.SI.Force F_friction;
      //Resultierente Kraft durch Widerstand bei Bewegung durch Umgebungsgas!
      //Klassen
      FallschirmBibliothek5.Person person(name = "Harald", mass = 85, position(start = flugzeug.height), area_front = 0.7, cW = 0.78);
      FallschirmBibliothek5.Flugzeug flugzeug(height = 2000);
      FallschirmBibliothek5.Umgebung luft(rho = 1.225);
      //Modelica-Blöcke
    equation
      F_friction = 0.5 * person.cW * person.area_front * luft.rho * person.velocity ^ 2;
      if noEvent(person.position > 0) then
        person.acceleration * person.mass = person.mass * g_earth;
      else
        person.acceleration = 0;
      end if;
      
      when time > 0 and person.acceleration == 0 then
        reinit(person.velocity, 0);
      end when;
      annotation(
        experiment(StartTime = 0, StopTime = 150, Tolerance = 1e-06, Interval = 0.01));
    end Fallschirmsprung5;

    class Person
      //Konstanten
      import Modelica.Constants.inf;
      //Parameter
      parameter Modelica.Units.SI.Mass mass = 80 "Masse der Person";
      parameter String name = "Max MustermPerson" "Name der Person";
      parameter Modelica.Units.SI.Area area_front = 1 "projizierte Fläche der Person bei Frontalansicht";
      parameter Real cW = 0.78 "strömungswiderstand einer Person bei frontaler Angriffsfäche";
      //Variablen
      Modelica.Units.SI.Position position;
      //(vertikale) Position (des Schwerpunktes) der Person über dem Erdboden
      Modelica.Units.SI.Velocity velocity;
      //(vertikale) Geschwindigkeit (des Schwerpunktes) der Person gegenüber dem Erdboden
      Modelica.Units.SI.Acceleration acceleration;
      //(vertikale) Beschleunigung (des Schwerpunktes) der Person über dem Erdboden
      //Klassen
      //Modelica-Blöcke
    equation
      der(position) = velocity;
      der(velocity) = acceleration;
    end Person;

    class Flugzeug
      //Konstanten
      //Parameter
      parameter Modelica.Units.SI.Height height = 2000;
      //Variablen
      //Klassen
      //Modelica-Blöcke
    end Flugzeug;

    class Umgebung
      parameter Modelica.Units.SI.Density rho "Dichte des Umgebungsgases";
    end Umgebung;
    annotation(
      uses(Modelica(version = "4.0.0")));
  end FallschirmBibliothek5;

  //Version 6

  package FallschirmBibliothek6
    model Fallschirmsprung6
      //Konstanten
      import Modelica.Constants.g_n;
      //Durchschnittliche Beschleunigung aus der Erde basierend auf der Gravitationskraft der Erde
      constant Modelica.Units.SI.Acceleration g_earth = -g_n;
      //Beschleunigung der Erde mit Bezugssystem
      //Parameter
      parameter Modelica.Units.SI.Force F_g = person.mass * g_earth;
      //resultierende Graft durch die Gravitation des Planeten!
      //Variablen
      Modelica.Units.SI.Force F_friction;
      //Resultierente Kraft durch Widerstand bei Bewegung durch Umgebungsgas!
      //Klassen
      FallschirmBibliothek6.Person person(name = "Harald", mass = 85, position(start = flugzeug.height), area_front = 1.0, cW = 0.78);
      FallschirmBibliothek6.Flugzeug flugzeug(height = 2000);
      FallschirmBibliothek6.Umgebung luft(rho = 1.225);
      FallschirmBibliothek6.Fallschirm fallschirm(area_open = 15.0, cW = 1.33);
      //Modelica-Blöcke
    equation
      if person.position > 500 then
        F_friction = 0.5 * person.cW * person.area_front * luft.rho * person.velocity ^ 2;
      else
        F_friction = 0.5 * fallschirm.cW * fallschirm.area_open * luft.rho * person.velocity ^ 2;
      end if;
      if noEvent(person.position > 0) then
        person.acceleration * person.mass = F_g + F_friction;
      else
        person.acceleration = 0;
      end if;
      
      when time > 0 and person.acceleration == 0 and person.position < 1.0 then
        reinit(person.velocity, 0);
      end when;
      annotation(
        experiment(StartTime = 0, StopTime = 150, Tolerance = 1e-06, Interval = 0.01));
    end Fallschirmsprung6;

    class Person
      //Konstanten
      import Modelica.Constants.inf;
      //Parameter
      parameter Modelica.Units.SI.Mass mass = 80 "Masse der Person";
      parameter String name = "Max MustermPerson" "Name der Person";
      parameter Modelica.Units.SI.Area area_front = 1 "prokizierte Fläche der Person bei Frontalansicht";
      parameter Real cW = 0.78 "strömungswiderstand einer Person bei frontaler Angriffsfäche";
      //Variablen
      Modelica.Units.SI.Position position;
      //(vertikale) Position (des Schwerpunktes) der Person über dem Erdboden
      Modelica.Units.SI.Velocity velocity;
      //(vertikale) Geschwindigkeit (des Schwerpunktes) der Person gegenüber dem Erdboden
      Modelica.Units.SI.Acceleration acceleration;
      //(vertikale) Beschleunigung (des Schwerpunktes) der Person über dem Erdboden
      //Klassen
      //Modelica-Blöcke
    equation
      der(position) = velocity;
      der(velocity) = acceleration;
    end Person;

    class Flugzeug
      //Konstanten
      //Parameter
      parameter Modelica.Units.SI.Height height = 2000;
      //Variablen
      //Klassen
      //Modelica-Blöcke
    end Flugzeug;

    class Umgebung
      parameter Modelica.Units.SI.Density rho "Dichte des Umgebungsgases";
    end Umgebung;

    class Fallschirm
      //Konstanten
      //Parameter
      parameter Modelica.Units.SI.Area area_open = 5 "Projektionsfläche eines geöffneten Fallschirms";
      parameter Real cW = 1.33 "Strömungswiderstandskoeffizient eines geööfneten Fallschirms";
      //Variablen
      //Klassen
      //Modelica-Blöcke
    end Fallschirm;
    annotation(
      uses(Modelica(version = "4.0.0")));
  end FallschirmBibliothek6;

  //Version 7

  package FallschirmBibliothek7
    model Fallschirmsprung7
      //Konstanten
      import Modelica.Constants.g_n;
      //Durchschnittliche Beschleunigung aus der Erde basierend auf der Gravitationskraft der Erde
      constant Modelica.Units.SI.Acceleration g_earth = -g_n;
      //Beschleunigung der Erde mit Bezugssystem
      //Parameter
      parameter Modelica.Units.SI.Force F_g = person.mass * g_earth;
      //resultierende Graft durch die Gravitation des Planeten!
      //Variablen
      Modelica.Units.SI.Force F_friction;
      //Resultierente Kraft durch Widerstand bei Bewegung durch Umgebungsgas!
      //Klassen
      FallschirmBibliothek7.Person person(name = "Harald", mass = 85, position(start = flugzeug.height), area_front = 1.0, cW = 0.78);
      FallschirmBibliothek7.Flugzeug flugzeug(height = 2000);
      FallschirmBibliothek7.Umgebung luft(rho = 1.225);
      FallschirmBibliothek7.Fallschirm fallschirm(area_open = 15.0, area_closed = person.area_front, cW_closed = person.cW);
      //Modelica-Block
    equation
      if person.position > 500 then
        F_friction = 0.5 * person.cW * person.area_front * luft.rho * person.velocity ^ 2;
        fallschirm.reisleine_gezogen = false;
      else
        F_friction = 0.5 * fallschirm.cW * fallschirm.area * luft.rho * person.velocity ^ 2;
        fallschirm.reisleine_gezogen = true;
      end if;
      if noEvent(person.position > 0) then
        person.acceleration * person.mass = F_g + F_friction;
      else
        person.acceleration = 0;
      end if;
      
      when time > 0 and person.acceleration == 0 and person.position < 1.0 then
        reinit(person.velocity, 0);
      end when;
      annotation(
        experiment(StartTime = 0, StopTime = 150, Tolerance = 1e-06, Interval = 0.01));
    end Fallschirmsprung7;

    class Person
      //Konstanten
      import Modelica.Constants.inf;
      //Parameter
      parameter Modelica.Units.SI.Mass mass = 80 "Masse der Person";
      parameter String name = "Max MustermPerson" "Name der Person";
      parameter Modelica.Units.SI.Area area_front = 1 "prokizierte Fläche der Person bei Frontalansicht";
      parameter Real cW = 0.78 "strömungswiderstand einer Person bei frontaler Angriffsfäche";
      //Variablen
      Modelica.Units.SI.Position position;
      //(vertikale) Position (des Schwerpunktes) der Person über dem Erdboden
      Modelica.Units.SI.Velocity velocity;
      //(vertikale) Geschwindigkeit (des Schwerpunktes) der Person gegenüber dem Erdboden
      Modelica.Units.SI.Acceleration acceleration;
      //(vertikale) Beschleunigung (des Schwerpunktes) der Person über dem Erdboden
      //Klassen
      //Modelica-Blöcke
    equation
      der(position) = velocity;
      der(velocity) = acceleration;
    end Person;

    class Flugzeug
      //Konstanten
      //Parameter
      parameter Modelica.Units.SI.Height height = 2000;
      //Variablen
      //Klassen
      //Modelica-Blöcke
    end Flugzeug;

    class Umgebung
      parameter Modelica.Units.SI.Density rho "Dichte des Umgebungsgases";
    end Umgebung;

    class Fallschirm
      //Konstanten
      import Modelica.Math.exp;
      import Modelica.Math.log;
      //Parameter
      parameter Modelica.Units.SI.Area area_open = 5 "Projektionsfläche eines geöffneten Fallschirms";
      parameter Modelica.Units.SI.Area area_closed = 0 "Projektionsflächte eines geschlossenen Fallschirms";
      parameter Modelica.Units.SI.Time opening_duration = 3 "Dauer die der Fallschirm zum Öffnen benötigten";
      parameter Real cW_closed "Strömungswiderstandskoeffizient eines geschlossenen Fallschirms";
      parameter Real cW_open = 1.33 "Strömungswiderstandskoeffizient eines geöfneten Fallschirms";
      //Variablen
      Modelica.Units.SI.Area area "Projektionsfläche des Fallschirms zum Zeitpunkt t";
      Real cW "Strömungswiderstand des Fallschirms zum Zeitpunkt t";
      Boolean reisleine_gezogen "gibt an ob die Reisleine des Fallschirms gezogen wurde";
      Modelica.Units.SI.Time opening_time "Dauer die der Fallschirm zum Öffnen benötigten";
      //Klassen
      //Modelica-Blöcke
      Modelica.Blocks.Continuous.CriticalDamping damper_area(f = 5, n = 3, y_start = area_closed);
      Modelica.Blocks.Continuous.CriticalDamping damper_cW(f = 5, n = 3, y_start = cW_closed);
    equation
      when reisleine_gezogen then
        opening_time = time;
      end when;
      if not reisleine_gezogen then
        damper_cW.u = cW_closed;
        damper_area.u = area_closed;
      else
        damper_cW.u = cW_open;
        damper_area.u = (area_open - area_closed) / (1 + exp(-(10 / opening_duration * (time - opening_time) - log((area_open - area_closed) ^ 2 / 2) - 1 / (area_open - area_closed)))) + area_closed;
      end if;
      area = damper_area.y;
      cW = damper_cW.y;
    annotation(
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));end Fallschirm;
    annotation(
      uses(Modelica(version = "4.0.0")));
  end FallschirmBibliothek7;

  //Version 8

  package FallschirmBibliothek8
    model Fallschirmsprung8
      //Konstanten
      import Modelica.Constants.g_n;
      //Durchschnittliche Beschleunigung aus der Erde basierend auf der Gravitationskraft der Erde
      constant Modelica.Units.SI.Acceleration g_earth = -g_n;
      //Beschleunigung der Erde mit Bezugssystem
      //Parameter
      parameter Modelica.Units.SI.Force F_g = person.mass * g_earth;
      //resultierende Graft durch die Gravitation des Planeten!
      //Variablen
      Modelica.Units.SI.Force F_friction;
      //Resultierente Kraft durch Widerstand bei Bewegung durch Umgebungsgas!
      //Klassen
      FallschirmBibliothek8.Person person(name = "Harald", mass = 85, position(start = flugzeug.height), area_front = 1.0, cW = 0.78);
      FallschirmBibliothek8.Flugzeug flugzeug(height = 2000);
      FallschirmBibliothek8.Umgebung luft(h = person.position);
      FallschirmBibliothek8.Fallschirm fallschirm(area_open = 15.0, area_closed = person.area_front, cW_closed = person.cW);
      //Modelica-Block
    equation
      if person.position > 500 then
        F_friction = 0.5 * person.cW * person.area_front * luft.rho * person.velocity ^ 2;
        fallschirm.reisleine_gezogen = false;
      else
        F_friction = 0.5 * fallschirm.cW * fallschirm.area * luft.rho * person.velocity ^ 2;
        fallschirm.reisleine_gezogen = true;
      end if;
      if noEvent(person.position > 0) then
        person.acceleration * person.mass = F_g + F_friction;
      else
        person.acceleration = 0;
      end if;
      
      when time > 0 and person.acceleration == 0 and person.position < 1.0 then
        reinit(person.velocity, 0);
      end when;
      annotation(
        experiment(StartTime = 0, StopTime = 150, Tolerance = 1e-6, Interval = 0.01));
    end Fallschirmsprung8;

    class Person
      //Konstanten
      import Modelica.Constants.inf;
      //Parameter
      parameter Modelica.Units.SI.Mass mass = 80 "Masse der Person";
      parameter String name = "Max MustermPerson" "Name der Person";
      parameter Modelica.Units.SI.Area area_front = 1 "prokizierte Fläche der Person bei Frontalansicht";
      parameter Real cW = 0.78 "strömungswiderstand einer Person bei frontaler Angriffsfäche";
      //Variablen
      Modelica.Units.SI.Position position;
      //(vertikale) Position (des Schwerpunktes) der Person über dem Erdboden
      Modelica.Units.SI.Velocity velocity;
      //(vertikale) Geschwindigkeit (des Schwerpunktes) der Person gegenüber dem Erdboden
      Modelica.Units.SI.Acceleration acceleration;
      //(vertikale) Beschleunigung (des Schwerpunktes) der Person über dem Erdboden
      //Klassen
      //Modelica-Blöcke
    equation
      der(position) = velocity;
      der(velocity) = acceleration;
    end Person;

    class Flugzeug
      //Konstanten
      //Parameter
      parameter Modelica.Units.SI.Height height = 2000;
      //Variablen
      //Klassen
      //Modelica-Blöcke
    end Flugzeug;

    class Umgebung
      constant Real R = Modelica.Constants.R;
      //Universelle Gaskonstante
      constant Modelica.Units.SI.AbsolutePressure p_0 = 101325;
      //Luftdruck auf Meereshöhe
      parameter Modelica.Units.SI.MolarMass M = 0.028949 "Molare Masse des Gases";
      parameter Modelica.Units.SI.Height H_0 = 7800 "Skalenhöhe im erdnahen Bereich";
      Modelica.Units.SI.Density rho "Dichte des Umgebungsgases";
      Modelica.Units.SI.Temperature T "Temperatur der Umgebungsluft";
      Modelica.Units.SI.AbsolutePressure p "Luftdruck der Umgebungsluft";
      Modelica.Units.SI.Height h "aktuelle Höhe über dem Meeresspiegel";
    equation
      rho = p * M / (T * R);
      T = 294.15 - 7.5 / 1000 * h;
      p = p_0 * exp(-h / H_0);
    end Umgebung;

    class Fallschirm
      //Konstanten
      import Modelica.Math.exp;
      import Modelica.Math.log;
      //Parameter
      parameter Modelica.Units.SI.Area area_open = 5 "Projektionsfläche eines geöffneten Fallschirms";
      parameter Modelica.Units.SI.Area area_closed = 0 "Projektionsflächte eines geschlossenen Fallschirms";
      parameter Modelica.Units.SI.Time opening_duration = 3 "Dauer die der Fallschirm zum Öffnen benötigten";
      parameter Real cW_closed "Strömungswiderstandskoeffizient eines geschlossenen Fallschirms";
      parameter Real cW_open = 1.33 "Strömungswiderstandskoeffizient eines geöfneten Fallschirms";
      //Variablen
      Modelica.Units.SI.Area area "Projektionsfläche des Fallschirms zum Zeitpunkt t";
      Real cW "Strömungswiderstand des Fallschirms zum Zeitpunkt t";
      Boolean reisleine_gezogen "gibt an ob die Reisleine des Fallschirms gezogen wurde";
      Modelica.Units.SI.Time opening_time "Dauer die der Fallschirm zum Öffnen benötigten";
      //Klassen
      //Modelica-Blöcke
      Modelica.Blocks.Continuous.CriticalDamping damper_area(f = 20, n = 3, y_start = area_closed);
      Modelica.Blocks.Continuous.CriticalDamping damper_cW(f = 20, n = 3, y_start = cW_closed);
    equation
      when reisleine_gezogen then
        opening_time = time;
      end when;
      if not reisleine_gezogen then
        damper_cW.u = cW_closed;
        damper_area.u = area_closed;
      else
        damper_cW.u = cW_open;
        damper_area.u = (area_open - area_closed) / (1 + exp(-(10 / opening_duration * (time - opening_time) - log((area_open - area_closed) ^ 2 / 2) - 1 / (area_open - area_closed)))) + area_closed;
      end if;
      area = damper_area.y;
      cW = damper_cW.y;
    end Fallschirm;
    annotation(
      uses(Modelica(version = "4.0.0")));
  end FallschirmBibliothek8;

  //Version 9

  package FallschirmBibliothek9
    model Fallschirmsprung9
      //Konstanten
      import Modelica.Constants.G;
      //Newton'sche Gravitationskonstante
      //Parameter
      //Variablen
      Modelica.Units.SI.Force F_friction;
      //Resultierente Kraft durch Widerstand bei Bewegung durch Umgebungsgas!
      Modelica.Units.SI.Force F_g;
      //resultierende Graft durch die Gravitation des Planeten!
      //Klassen
      FallschirmBibliothek9.Person person(name = "Harald", mass = 85, position(start = flugzeug.height), area_front = 1.0, cW = 0.78);
      FallschirmBibliothek9.Flugzeug flugzeug(height = 2000);
      FallschirmBibliothek9.Umgebung luft(h = person.position);
      FallschirmBibliothek9.Fallschirm fallschirm(area_open = 15.0, area_closed = person.area_front, cW_closed = person.cW);
      FallschirmBibliothek9.Planet erde(name = "Erde", mass = 5.972e24, radius = 6371e3);
      //Modelica-Block
    equation
      if person.position > 500 then
        F_friction = 0.5 * person.cW * person.area_front * luft.rho * person.velocity ^ 2;
        fallschirm.reisleine_gezogen = false;
      else
        F_friction = 0.5 * fallschirm.cW * fallschirm.area * luft.rho * person.velocity ^ 2;
        fallschirm.reisleine_gezogen = true;
      end if;
      F_g = G * (erde.mass * person.mass / (erde.radius + person.position) ^ 2);
      if noEvent(person.position > 0) then
        person.acceleration * person.mass = (-F_g) + F_friction;
      else
        person.acceleration = 0;
      end if;
      
      when time > 0 and person.acceleration == 0 and person.position < 1.0 then
        reinit(person.velocity, 0);
      end when;
      annotation(
        experiment(StartTime = 0, StopTime = 150, Tolerance = 1e-06, Interval = 0.01));
    end Fallschirmsprung9;

    class Person
      //Konstanten
      import Modelica.Constants.inf;
      //Parameter
      parameter Modelica.Units.SI.Mass mass = 80 "Masse der Person";
      parameter String name = "Max MustermPerson" "Name der Person";
      parameter Modelica.Units.SI.Area area_front = 1 "prokizierte Fläche der Person bei Frontalansicht";
      parameter Real cW = 0.78 "strömungswiderstand einer Person bei frontaler Angriffsfäche";
      //Variablen
      Modelica.Units.SI.Position position;
      //(vertikale) Position (des Schwerpunktes) der Person über dem Erdboden
      Modelica.Units.SI.Velocity velocity;
      //(vertikale) Geschwindigkeit (des Schwerpunktes) der Person gegenüber dem Erdboden
      Modelica.Units.SI.Acceleration acceleration;
      //(vertikale) Beschleunigung (des Schwerpunktes) der Person über dem Erdboden
      //Klassen
      //Modelica-Blöcke
    equation
      der(position) = velocity;
      der(velocity) = acceleration;
    end Person;

    class Flugzeug
      //Konstanten
      //Parameter
      parameter Modelica.Units.SI.Height height = 2000;
      //Variablen
      //Klassen
      //Modelica-Blöcke
    end Flugzeug;

    class Umgebung
      constant Real R = Modelica.Constants.R;
      //Universelle Gaskonstante
      constant Modelica.Units.SI.AbsolutePressure p_0 = 101325;
      //Luftdruck auf Meereshöhe
      parameter Modelica.Units.SI.MolarMass M = 0.028949 "Molare Masse des Gases";
      parameter Modelica.Units.SI.Height H_0 = 7800 "Skalenhöhe im erdnahen Bereich";
      Modelica.Units.SI.Density rho "Dichte des Umgebungsgases";
      Modelica.Units.SI.Temperature T "Temperatur der Umgebungsluft";
      Modelica.Units.SI.AbsolutePressure p "Luftdruck der Umgebungsluft";
      Modelica.Units.SI.Height h "aktuelle Höhe über dem Meeresspiegel";
    equation
      rho = p * M / (T * R);
      T = 294.15 - 7.5 / 1000 * h;
      p = p_0 * exp(-h / H_0);
    end Umgebung;

    class Fallschirm
      //Konstanten
      import Modelica.Math.exp;
      import Modelica.Math.log;
      //Parameter
      parameter Modelica.Units.SI.Area area_open = 5 "Projektionsfläche eines geöffneten Fallschirms";
      parameter Modelica.Units.SI.Area area_closed = 0 "Projektionsflächte eines geschlossenen Fallschirms";
      parameter Modelica.Units.SI.Time opening_duration = 3 "Dauer die der Fallschirm zum Öffnen benötigten";
      parameter Real cW_closed "Strömungswiderstandskoeffizient eines geschlossenen Fallschirms";
      parameter Real cW_open = 1.33 "Strömungswiderstandskoeffizient eines geöfneten Fallschirms";
      //Variablen
      Modelica.Units.SI.Area area "Projektionsfläche des Fallschirms zum Zeitpunkt t";
      Real cW "Strömungswiderstand des Fallschirms zum Zeitpunkt t";
      Boolean reisleine_gezogen "gibt an ob die Reisleine des Fallschirms gezogen wurde";
      Modelica.Units.SI.Time opening_time "Dauer die der Fallschirm zum Öffnen benötigten";
      //Klassen
      //Modelica-Blöcke
      Modelica.Blocks.Continuous.CriticalDamping damper_area(f = 20, n = 3, y_start = area_closed);
      Modelica.Blocks.Continuous.CriticalDamping damper_cW(f = 20, n = 3, y_start = cW_closed);
    equation
      when reisleine_gezogen then
        opening_time = time;
      end when;
      if not reisleine_gezogen then
        damper_cW.u = cW_closed;
        damper_area.u = area_closed;
      else
        damper_cW.u = cW_open;
        damper_area.u = (area_open - area_closed) / (1 + exp(-(10 / opening_duration * (time - opening_time) - log((area_open - area_closed) ^ 2 / 2) - 1 / (area_open - area_closed)))) + area_closed;
      end if;
      area = damper_area.y;
      cW = damper_cW.y;
    end Fallschirm;

    class Planet
      //Konstanten
      //Parameter
      parameter String name = "Erde" "Name des Planeten";
      parameter Modelica.Units.SI.Mass mass "Masse des Planeten";
      parameter Modelica.Units.SI.Length radius "Radius des Planeten";
      //Variablen
      //Klassen
      //Modelica-Blöcke
    end Planet;
    annotation(
      uses(Modelica(version = "4.0.0")));
  end FallschirmBibliothek9;
end Fallschirmsprung_Stufen;
