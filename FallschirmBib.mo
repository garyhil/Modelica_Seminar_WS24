package FallschirmBibliothek
  model Fallschirmsprung
    //Konstanten
        import Modelica.Constants.g_n;  //Durchschnittliche Beschleunigung auf der Erde basierend auf der Gravitationskraft der Erde
    //Parameter
    //Variablen
    //Klassen
        FallschirmBibliothek.Person person(name="Gary", mass = 85);
    //Modelica-Blöcke
    
    equation
    person.acceleration * person.mass = person.mass * g_n;
    
  end Fallschirmsprung;

  class Person
    //Konstanten
    //Parameter
        parameter Modelica.Units.SI.Mass mass = 80;
        parameter String name = "Max MustermPerson";
    //Variablen
        Modelica.Units.SI.Acceleration acceleration; //Beschleunigung (des Schwerpunktes) der Person
    //Klassen
    //Modelica-Blöcke
  end Person;
annotation(uses(Modelica(version="4.0.0")));
end FallschirmBibliothek;