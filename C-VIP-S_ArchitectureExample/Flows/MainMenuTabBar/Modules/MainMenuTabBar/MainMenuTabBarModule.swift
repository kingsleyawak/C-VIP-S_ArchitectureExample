//
//  MainMenuTabBarModule.swift
//  C-VIP-S_ArchitectureExample
//
//  Created by Kingsley Edem Awak on 3/27/19.
//  Copyright © 2019 Kingsley Edem Awak. All rights reserved.
//

import UIKit


class MainMenuTabBarModule:MainTabBarModuleProtocol {

    var interactor: MainTabBarInteractorProtocol
    var presenter: MainTabBarPresenterProtocol
    var view: MainTabBarViewProtocol
    
    var onLoad: NavigationControllerCompletion?
    var onProfileFlowSelect: NavigationControllerCompletion?
    var onMainInformationFlowSelect: NavigationControllerCompletion?
    
    init(interactor:MainTabBarInteractorProtocol, presenter:MainTabBarPresenterProtocol, view:MainTabBarViewProtocol) {
        self.interactor = interactor
        self.presenter = presenter
        self.view = view
    }
    
    func viewToPresent() -> View {
        return view
    }
    
    func onLoad(tabNavigationController: UINavigationController) {
        onLoad?(tabNavigationController)
    }
    
    func onProfileTabSelected(tabNavigationController: UINavigationController) {
        onProfileFlowSelect?(tabNavigationController)
    }
    func onMainInformationTabSelected(tabNavigationController: UINavigationController) {
        onMainInformationFlowSelect?(tabNavigationController)
    }
   
    
}
