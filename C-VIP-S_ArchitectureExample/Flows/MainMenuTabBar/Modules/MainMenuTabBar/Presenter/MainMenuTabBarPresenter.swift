//
//  MainMenuTabBarMainMenuTabBarPresenter.swift
//  C-VIP-S_ArchitectureExample
//
//  Created by Kingsley Edem Awak on 27/03/2019.
//  Copyright © 2019 New Line Technologies. All rights reserved.
//

import UIKit

class MainMenuTabBarPresenter: MainTabBarPresenterProtocol {
    
    
    weak var module: MainTabBarModuleProtocol?
    weak var interactor: MainTabBarInteractorProtocol?
    weak var view: MainTabBarViewProtocol?
    
    func notifyViewLoaded(navigationController: UINavigationController) {
        module?.onLoad(tabNavigationController: navigationController)
    }
    
    func onProfileTabTapped(navigationController: UINavigationController) {
        module?.onProfileTabSelected(tabNavigationController: navigationController)
    }

}
