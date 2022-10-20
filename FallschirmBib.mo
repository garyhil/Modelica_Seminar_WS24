//Version 7
package FallschirmBibliothek
  model Fallschirmsprung
  //Konstanten
    import Modelica.Constants.g_n;  //Durchschnittliche Beschleunigung aus der Erde basierend auf der Gravitationskraft der Erde
    constant Modelica.Units.SI.Acceleration g_earth = -g_n; //Beschleunigung der Erde mit Bezugssystem
  //Parameter
    parameter Modelica.Units.SI.Force F_g = person.mass * g_earth; //resultierende Graft durch die Gravitation des Planeten!
  //Variablen
    Modelica.Units.SI.Force F_friction; //Resultierente Kraft durch Widerstand bei Bewegung durch Umgebungsgas!
  //Klassen
    FallschirmBibliothek.Person person(name="Gary", mass = 85, position(start=flugzeug.height), area_front = 1.0, cW = 0.78);
    FallschirmBibliothek.Flugzeug flugzeug(height = 2000);
    FallschirmBibliothek.Umgebung luft(rho=1.225);
    FallschirmBibliothek.Fallschirm fallschirm(area_open = 5.0, area_closed = person.area_front, cW_closed = person.cW);
  //Modelica-Block
  
  equation
  if person.position > 500 then
    F_friction = 0.5 * person.cW * person.area_front * luft.rho * person.velocity^2;
    fallschirm.reisleine_gezogen = false;
  else
    F_friction = 0.5 * fallschirm.cW * fallschirm.area* luft.rho * person.velocity^2;
    fallschirm.reisleine_gezogen = true;
  end if;
  person.acceleration * person.mass = F_g + F_friction;
  
  algorithm
    when person.position < 0 then
      terminate("The person landed!");
    end when;
  end Fallschirmsprung;

  class Person
  //Konstanten
    import Modelica.Constants.inf;
  //Parameter
    parameter Modelica.Units.SI.Mass mass = 80 "Masse der Person";
    parameter String name = "Max MustermPerson" "Name der Person";
    parameter Modelica.Units.SI.Area area_front = 1 "prokizierte Fläche der Person bei Frontalansicht";
    parameter Real cW = 0.78 "strömungswiderstand einer Person bei frontaler Angriffsfäche";
  //Variablen
    Modelica.Units.SI.Position position; //(vertikale) Position (des Schwerpunktes) der Person über dem Erdboden
    Modelica.Units.SI.Velocity velocity; //(vertikale) Geschwindigkeit (des Schwerpunktes) der Person gegenüber dem Erdboden
    Modelica.Units.SI.Acceleration acceleration; //(vertikale) Beschleunigung (des Schwerpunktes) der Person über dem Erdboden
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
    Modelica.Blocks.Continuous.CriticalDamping damper_area(f=20, n=3, y_start = area_closed);
    Modelica.Blocks.Continuous.CriticalDamping damper_cW(f=20, n=3, y_start = cW_closed);
  equation
    
    when reisleine_gezogen then
      opening_time = time;
    end when; 
    if not reisleine_gezogen then
      damper_cW.u = cW_closed;
      damper_area.u = area_closed;
    else
      damper_cW.u = cW_open;
      damper_area.u = ((area_open-area_closed)/(1+exp(-((10/opening_duration*(time-opening_time))-(log((area_open-area_closed)^2/(2)))-(1/(area_open-area_closed))))))+area_closed;
    end if;
    area = damper_area.y;
    cW = damper_cW.y;
end Fallschirm;

annotation(uses(Modelica(version="4.0.0")));
end FallschirmBibliothek;