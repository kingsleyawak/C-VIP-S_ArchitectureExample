//
//  MainMenuTabBarCoordinator.swift
//  C-VIP-S_ArchitectureExample
//
//  Created by Kingsley Edem Awak on 3/27/19.
//  Copyright © 2019 Kingsley Edem Awak. All rights reserved.
//

import UIKit

class MainMenuTabBarCoordinator:BaseCoordinator {
    
    private var tabBarModule:MainTabBarModuleProtocol!
    
    override init(router: Router) {
        super.init(router: router)
        self.tabBarModule = MainMenuTabBarModuleConfigurator.makeModule()
    }
    
    override func start() {
        router.setAsRoot(tabBarModule, animated: false, hideNavigationBar: true)
        runTabBarFlow()
    }
    
    private func runTabBarFlow() {
        tabBarModule.onLoad = runProfileFlow()
        tabBarModule.onProfileFlowSelect = runProfileFlow()
    }
    
    private func runProfileFlow() -> NavigationControllerCompletion {
        return { [unowned self] navigationController in
            if navigationController.viewControllers.isEmpty {
                let profileCoordinator = ProfileCoordinator(router: BaseRouter(rootNavigationController: navigationController))
                self.addDependency(profileCoordinator)
                profileCoordinator.start()
            }
        }
    }
    
   
    
}
