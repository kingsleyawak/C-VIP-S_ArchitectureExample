//
//  ApplicationCoordinator.swift
//  C-VIP-S_ArchitectureExample
//
//  Created by Kingsley Edem Awak on 3/27/19.
//  Copyright © 2019 Kingsley Edem Awak. All rights reserved.
//

import Foundation



final class ApplicationCoordinator:BaseCoordinator {

    override func start() {
        start(with: .defaultOpening)
    }
    
    func start(with launchType:ApplicationLaunchType) {
        
        switch launchType {
        case .deepLink(let url):
            break
        case .defaultOpening:
            break
        case .forceTouch:
            break
        case .pushNotification:
            break
        }

        runMainFlow()
    }
    
    private func runMainFlow() {
        let mainTabsCoordinator = MainMenuTabBarCoordinator(router: self.router)
        addDependency(mainTabsCoordinator)
        mainTabsCoordinator.start()
    }
    
    private func runAuthFlow() {
        
    }
    
    private func runOnboardingFlow() {
        
    }
    
}
