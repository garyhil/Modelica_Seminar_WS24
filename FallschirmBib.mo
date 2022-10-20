//Version 5
package FallschirmBibliothek
  model Fallschirmsprung
  //Konstanten
    import Modelica.Constants.g_n;  //Durchschnittliche Beschleunigung aus der Erde basierend auf der Gravitationskraft der Erde
    constant Modelica.Units.SI.Acceleration g_earth = -g_n; //Beschleunigung der Erde mit Bezugssystem
  //Parameter
    parameter Modelica.Units.SI.Force F_g = person.mass * g_earth;        //resultierende Graft durch die Gravitation des Planeten!
  //Variablen
    Modelica.Units.SI.Force F_friction; //Resultierente Kraft durch Widerstand bei Bewegung durch Umgebungsgas!
  //Klassen
    FallschirmBibliothek.Person person(name="Gary", mass = 85, position(start=flugzeug.height), area_front = 1.0, cW = 0.78);
    FallschirmBibliothek.Flugzeug flugzeug(height = 2000);
    FallschirmBibliothek.Umgebung luft(rho=1.225);
  //Modelica-Blöcke
  
  
  equation
  F_friction = 0.5 * person.cW * person.area_front * luft.rho * person.velocity^2;
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

annotation(uses(Modelica(version="4.0.0")));
end FallschirmBibliothek;