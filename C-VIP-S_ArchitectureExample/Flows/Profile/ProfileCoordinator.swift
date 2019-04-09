//
//  ProfileCoordinator.swift
//  C-VIP-S_ArchitectureExample
//
//  Created by Kingsley Edem Awak on 3/29/19.
//  Copyright © 2019 Kingsley Edem Awak. All rights reserved.
//

import UIKit

class ProfileCoordinator:BaseCoordinator {
    
    override func start() {
        showMainProfile()
    }
    
    private func showMainProfile() {
        let mainProfileModule = ProfileModuleConfigurator.makeModule()
        router.setAsRoot(mainProfileModule, animated: false, hideNavigationBar: true)
    }
    
}
