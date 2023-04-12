
# Modelica-Seminar: Skydiving Example

 
This Github repository contains a Modelica project that simulates the behavior of a skydiver during a freefall. The project consists of nine different detail levels, each providing a different level of complexity and accuracy in the simulation.

## Detail-Level 1 
The "Fallschirmsprung1" model simulates the behavior of a skydiver during a freefall, taking into account only the gravitational force. The "Person" class defines the characteristics of the skydiver, such as their name and mass.

## Detail-Level 2
The Fallschirmsprung2 model simulates not only the acceleration experienced by a person during a skydiving jump based on the gravitational force of the earth and the mass of the person, but also the person's position and velocity relative to the ground.

The Person class in this library includes additional variables for position and velocity of the person's center of mass, in addition to the mass and name. The equations for the Person class describe the derivatives of the position and velocity, which are used to calculate the person's acceleration.

## Detail-Level 3
The Fallschirmsprung3 model simulates the acceleration, position, and velocity experienced by a person during a skydiving jump based on the gravitational force of the earth and the mass of the person, as well as the position and height of the airplane.

The Person class in this library includes variables for position and velocity of the person's center of mass, as well as the mass and name. The Flugzeug class includes a parameter for the height of the airplane from which the skydiver is jumping.

## Detail-Level 4
In addition to the simulation of the skydiving jump, Fallschirmsprung4 includes an algorithm that terminates the simulation when the person's position reaches the ground (i.e., when the person's position is less than zero). This algorithm adds a realistic component to the simulation and allows for accurate calculations of landing time.

## Detail-Level 5
The Fallschirmsprung5 model simulates the acceleration, position, and velocity experienced by a person during a skydiving jump based on the gravitational force of the earth, the mass of the person, the position and height of the airplane, the density of the surrounding gas, and the drag force experienced by the person due to the gas.

In addition to the simulation of the skydiving jump and termination when the person's position reaches the ground, Fallschirmsprung5 includes equations for calculating the drag force experienced by the person due to the surrounding gas. This adds a realistic component to the simulation and allows for more accurate calculations of the person's acceleration during the jump.

## Detail-Level 6
In Fallschirmsprung6, a new class called Fallschirm has been added, which represents a parachute. A Fallschirm object has two parameters, area_open and cW, which correspond to the projected area and the drag coefficient of an open parachute, respectively.

In the equation section of Fallschirmsprung6, an if statement has been added to calculate the value of F_friction, the force of air resistance acting on the person. If the person's position is greater than 500, the air resistance is calculated using the cW and area_front parameters of the Person class, as before. However, if the person's position is less than or equal to 500, indicating that the person has opened their parachute, the air resistance is calculated using the cW and area_open parameters of the Fallschirm class instead.

This change reflects the fact that the air resistance acting on a person during a skydive changes dramatically when a parachute is opened, as the large surface area of the parachute dramatically increases the force of air resistance.


## Detail-Level 7
In Fallschirmsprung7, a new class Fallschirm was introduced which represents a parachute used during the skydiving process. The class contains several parameters such as area_open, area_closed, cW_closed, and cW_open, which define the projected area and drag coefficients of the parachute when it is open and closed. Additionally, the opening_duration parameter is introduced which defines the time it takes for the parachute to fully open.

In the Fallschirmsprung7 model, an instance of the Fallschirm class is created, and the F_friction variable is now calculated using either the drag coefficient and projected area of the person or the parachute, depending on the vertical position of the person. If the person is above 500 meters, the F_friction variable is calculated using the person's drag coefficient and projected area. Otherwise, the F_friction variable is calculated using the parachute's drag coefficient and projected area.

Furthermore, a new boolean variable reisleine_gezogen is introduced in the Fallschirm class, which indicates whether the parachute's ripcord has been pulled or not. The projected area and drag coefficient of the parachute are updated using damper_area and damper_cW Modelica blocks, which use critical damping to gradually change the values over time. If the ripcord has not been pulled, the parachute remains closed, and its projected area and drag coefficient remain at their closed values. If the ripcord has been pulled, the parachute gradually opens over time according to the opening_duration parameter, and its projected area and drag coefficient change accordingly.

Finally, the experiment annotation in the Fallschirmsprung7 model is updated to reflect the new stop time and interval.

## Detail-Level 8
In this latest version of the model, which is contained in the FallschirmBibliothek8 package, several changes have been made to the previous version.

Firstly, in the Umgebung class, the rho variable has been updated to depend on the current height of the person object, which is passed in as a parameter. Additionally, the T and p variables have been updated to be equations that are solved based on the current altitude.

In the Fallschirm class, the damper_area and damper_cW objects have been modified to use a higher frequency, resulting in smoother behavior. Additionally, the cW_closed and cW_open parameters have been adjusted to more realistic values.

Finally, in the Fallschirmsprung8 model, the luft object has been updated to use the current position of the person object in the Umgebung class.

## Detail-Level 9
In this version of the project, the acceleration of the skydiver is calculated using the Newtonian Law of Gravitation, which takes into account the distance of the skydiver from the center of Earth's mass. However, upon comparing the simulation results between Detail-Level 8 and 9, it has been found that this extra information does not significantly improve the accuracy of the results. This serves as a reminder that not every single detail needs to be modeled, and one should consider the potential benefits of any changes to the model before implementing them.
## Badges

Add badges from somewhere like: [shields.io](https://shields.io/)

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)
[![GPLv3 License](https://img.shields.io/badge/License-GPL%20v3-yellow.svg)](https://opensource.org/licenses/)
[![AGPL License](https://img.shields.io/badge/license-AGPL-blue.svg)](http://www.gnu.org/licenses/agpl-3.0)


## Contributing

Contributions are always welcome!

See `contributing.md` for ways to get started.

Please adhere to this project's `code of conduct`.


## Authors

- [@garyhil](https://www.github.com/garyhil)

