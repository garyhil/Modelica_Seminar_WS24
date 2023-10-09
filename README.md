
# Modelica Seminar Wintersemester 23/24 GitHub Repository

Welcome to the Modelica Examples Repository for the University Class! This repository is a collection of Modelica code examples designed to support your learning in the field of modeling and simulation. You'll find a variety of Modelica models that cover different aspects of system modeling and simulation. This repository is planned to accompany the lecture. However, feel free to dig through the examples yourself.

## Introduction
Modelica is a powerful open-source language for modeling and simulating complex systems. It is widely used in academia and industry for system-level modeling and simulation. This repository aims to provide a set of examples that will help you understand and apply Modelica concepts presented during the lecture.

## Getting Started
To get started with the Modelica examples, follow these steps:


### Clone the4 repository into a prefered directory

```
git clone https://github.com/garyhil/Modelica_Seminar_WS23.git
```
    
### Install a Modelica Tool:
During the course we will use the "Open Modelica Connection Editor" (OME).
You can download it from [here](https://openmodelica.org/download/download-windows/).

### Browse the examples
You find the Modelica Files in the subdirectories of this repository. Just open them in the OME and play around with them.

## Whats inside the repository?
1. **FMDS (Feder Masse Dämpfer System)**
In this example you find two Modelica Files each presenting the same System, namely a FMDS. However one modelis implemented via the drag&drop Block Interface, the other one is simply coded.

2. **Temperature**
This example contains a model of a simple System consisting of 2 Temperature areas divided via a heat-resistor.
In this example we will talk more about the driving force of the physical processes of our models.

3. **Flaschenzug**
At this point we will know about the connector principle in more detail. Via this simple pulley model, we will learn about what we expect how a system will behave, and how important it is to think about the model outcomes **before** we hit simulate.

4. **Modelaufbau**
With those two examples we will first, learn how to build a new Model from scratch and what are the preferable steps to do so. Also we will talk about the special properties of discontinous systems, what ''Events'' are in a model and how they influence our system behaviour and solving procedure

5. **Tanksystem**
This subfolder contains a a model of two interconnected tanks. It will show the previously modeled Tank in action. We will also take a first glance at Models provided by the Modelica Standard Libary and learn what the advantages and disadvantages of prebuild Model Blocks are.

6. **external Blocks**
In this Model we will model a simplified wind turbine solely relying on provided Model Blocks. We will take a look at how to parametrize such blocks with other blocks and how we can learn what all the parameters of such a block are good for.

7. **Fallschirmsprung**
This last folder contains the model for a skydive jump. Here we completely model the whole thing by ourselfes. Main focus is on the process to further and further detail the model. However, we will also discuss aspects like "What is the focus of the model?" and "When is the needed model depth reached?".

## Authors

- [@garyhil](https://www.github.com/garyhil)


## Contributing

Contributions are always welcome!


## Badges
[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)
[![GPLv3 License](https://img.shields.io/badge/License-GPL%20v3-yellow.svg)](https://opensource.org/licenses/)
[![AGPL License](https://img.shields.io/badge/license-AGPL-blue.svg)](http://www.gnu.org/licenses/agpl-3.0)
