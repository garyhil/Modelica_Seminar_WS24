//Version 4
package FallschirmBibliothek
  model Fallschirmsprung
  //Konstanten
    import Modelica.Constants.g_n;  //Durchschnittliche Beschleunigung aus der Erde basierend auf der Gravitationskraft der Erde
    constant Modelica.Units.SI.Acceleration g_earth = -g_n; //Beschleunigung der Erde mit Bezugssystem
  //Parameter
  //Variablen
  //Klassen
    FallschirmBibliothek.Person person(name="Gary", mass = 85, position(start=flugzeug.height));
    FallschirmBibliothek.Flugzeug flugzeug(height = 2000);
  //Modelica-Blöcke
  
  
  equation
  person.acceleration * person.mass = person.mass * g_earth;
  
  algorithm
    when person.position < 0 then
      terminate("The person landed!");
    end when;
  end Fallschirmsprung;

  class Person
  //Konstanten
    import Modelica.Constants.inf;
  //Parameter
    parameter Modelica.Units.SI.Mass mass = 80;
    parameter String name = "Max MustermPerson";
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

annotation(uses(Modelica(version="4.0.0")));
end FallschirmBibliothek;