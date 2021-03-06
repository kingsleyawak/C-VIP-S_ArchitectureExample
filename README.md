# C-VIP-S ArchitectureExample
### Example of coordinator based architecture mixed with lightweight version of VIPER
#### C   - Coordinator
#### VIP - View, Interactor, Presenter
#### S   - Services
##### Main idea that we dividing application into some set of flows. Each flow are driven by coordinator. Coordinator handle navigation betwen VIP(View-Interactor-Presenter)-modules.  All bussiness logic happening in module interactor which have links to appropriate services. 

### VIP Module Structure Overview
![alt text](https://raw.githubusercontent.com/kingsleyawak/C-VIP-S_ArchitectureExample/master/README_FILES/module_structure.png)

### Protocols
Describes module structure and interaction between  module components

### Configurator
Knows how to build module. Static class. Should be used by coordinator module factory

### Presenter
Contains view logic for preparing content for display received from interactor, and knows how to react to user action received from view. Has link to parent module

### View
Sends user actions to the presenter and presenting data

### Interactor
Contains all business logic for module, have links to global application services

### Flow
Is a queue of screens that are logically chained. All of our screens can be divided by flows: auth flow, phone verify flow, booking flow, profile editing flow, etc.

### Coordinator 
Is an object that handles navigation flow and shares flow’s handling for the next coordinator after switching on the next chain. Contains router, array of child coordinators and optionally modules factory
![alt text](https://raw.githubusercontent.com/kingsleyawak/C-VIP-S_ArchitectureExample/master/README_FILES/coordinator.png)

#### Coordinator flow
![alt text](https://raw.githubusercontent.com/kingsleyawak/C-VIP-S_ArchitectureExample/master/README_FILES/coordinator_flow.png)

### Router
Knows how to present module

### SERVICES
![alt text](https://raw.githubusercontent.com/kingsleyawak/C-VIP-S_ArchitectureExample/master/README_FILES/services.png)

### Interaction between module and services
Modules getting links to global services during assembly process in module configurator
![alt text](https://raw.githubusercontent.com/kingsleyawak/C-VIP-S_ArchitectureExample/master/README_FILES/interactor_services.png)

## WORKFLOW
## In order to create a new flow in the application, you must proceed following steps:
1. In the «Flows»  folder create a folder with the name of the new flow (FLOWNAME) (for example «MainInformation»)
2. Inside this folder create file named (FLOWNAME) Coordinator (for example «MainInformationCoordinator»)
3. Inside this folder create storyboard named (FLOWNAME)
4. Also inside this folder create folder named «Modules» 
5. Each view controller in a storyboard must correspond to a view of a certain module from the certain flow (for example «LoginViewController» is view in «LoginModule», which is one of the module  in «Authorization» flow )

## In order to create a new module in flow, you must proceed following steps:
1. Open terminal in root folder of project
2. Type «generamba gen (MODULE_NAME) vip_module» (for example «generamba gen MainInformation vip_module»)
![alt text](https://raw.githubusercontent.com/kingsleyawak/C-VIP-S_ArchitectureExample/master/README_FILES/command.png)
3. Generamba going to create a new module and add it to this folder GeneratedClasses/Modules/(MODULE_NAME)
![alt text](https://raw.githubusercontent.com/kingsleyawak/C-VIP-S_ArchitectureExample/master/README_FILES/generationSuccess.png)
4. Move newly created module inside «Modules» folder for desired flow 
![alt text](https://raw.githubusercontent.com/kingsleyawak/C-VIP-S_ArchitectureExample/master/README_FILES/fileStructure.png)
5. Create new UIViewController in corresponding storyboard
6. Link(Set class name,StoryboardID and restorationID) with (MODULE_NAME)ViewController of newly created UIViewController
![alt text](https://raw.githubusercontent.com/kingsleyawak/C-VIP-S_ArchitectureExample/master/README_FILES/storyboardLink.png)
