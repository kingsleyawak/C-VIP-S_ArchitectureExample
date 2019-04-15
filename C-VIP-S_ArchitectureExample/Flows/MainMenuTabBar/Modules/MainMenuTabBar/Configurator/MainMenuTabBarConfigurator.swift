//
//  MainMenuTabBarMainMenuTabBarConfigurator.swift
//  C-VIP-S_ArchitectureExample
//
//  Created by Kingsley Edem Awak on 27/03/2019.
//  Copyright © 2019 New Line Technologies. All rights reserved.
//

import UIKit

class MainMenuTabBarModuleConfigurator:ModuleConfigurator {
    
    typealias ModuleType = MainTabBarModuleProtocol
    
    class func makeModule() -> MainTabBarModuleProtocol {
        let interactor = MainMenuTabBarInteractor()
        let presenter = MainMenuTabBarPresenter()
        let view = UIStoryboard(name: "MainMenuTabBar", bundle: nil).instantiateViewController(withIdentifier: "MainMenuTabBarViewController") as! MainMenuTabBarViewController
        
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        
        view.presenter = presenter
        
        let module = MainMenuTabBarModule(interactor:interactor, presenter:presenter, view:view)
        presenter.module = module
        
        return module
    }

}
