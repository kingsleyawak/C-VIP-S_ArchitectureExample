# C-VIP-S_ArchitectureExample
Example of coordinator based architecture mixed with lightweight version of VIPER


![alt text](https://raw.githubusercontent.com/kingsleyawak/C-VIP-S_ArchitectureExample/master/README_FILES/module_structure.png)

Protocols
Describes module structure and interaction between  module components

Configurator
Knows how to build module. Static class. Should be used by coordinator module factory

Presenter
Contains view logic for preparing content for display received from interactor, and knows how to react to user action received from view. Has link to parent module

View
Sends user actions to the presenter and presenting data

Interactor
Contains all business logic for module, have links to global application services

![alt text](https://raw.githubusercontent.com/kingsleyawak/C-VIP-S_ArchitectureExample/master/README_FILES/coordinator_flow.png)

Coordinator - is an object that handles navigation flow and shares flow’s handling for the next coordinator after switching on the next chain.

Flow is a queue of screens that are logically chained. All of our screens can be divided by flows: auth flow, phone verify flow, booking flow, profile editing flow, etc.


![alt text](https://raw.githubusercontent.com/kingsleyawak/C-VIP-S_ArchitectureExample/master/README_FILES/interactor_services.png)

SERVICES EXPLANATION SHOULD BE HERE

