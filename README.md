
# Fuel Calculator for NASA mission

## Description
This application aims to calculate fuel to launch from one planet of the solar system and land on another planet of the solar system, depending on the flight route.
````
Earth - 9.807 m/s2
Moon - 1.62 m/s2
Mars - 3.711 m/s2
````
### The formula for fuel calculations for the launch is the following:

````
mass * gravity * 0.042 - 33 rounded down
````
The formula for fuel calculations for the landing is the following:
````
mass * gravity * 0.033 - 42 rounded down
````
### examples of programs and required fuel for the whole mission:

````
Apollo 11:
path: launch Earth, land Moon, launch Moon, land Earth
weight of equipment: 28801 kg
weight of fuel: 51898 kg

Mission on Mars:
path: launch Earth, land Mars, launch Mars, land Earth
weight of equipment: 14606 kg
weight of fuel: 33388 kg

Passenger ship:
path: launch Earth, land Moon, launch Moon, land Mars, launch Mars, land Earth
weight of equipment: 75432 kg
weight of fuel: 212161 kg
````

### Run Rspec
````
rspec fuel_calculator_service_rspec.rb
````

### Run for show example mission
````
ruby app.rb
````
