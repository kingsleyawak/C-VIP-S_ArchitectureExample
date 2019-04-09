//
//  MainInformationCoordinator.swift
//  C-VIP-S_ArchitectureExample
//
//  Created by Kingsley Edem Awak on 4/9/19.
//  Copyright © 2019 Kingsley Edem Awak. All rights reserved.
//

import Foundation

class MainInformationCoordinator: BaseCoordinator {
    
    
    override func start() {
        showMainInformation()
    }
    
    private func showMainInformation() {
        let mainInformationModule = MainInformationModuleConfigurator.makeModule()
        router.setAsRoot(mainInformationModule, animated: false, hideNavigationBar: true)
    }
    
    
    
}
