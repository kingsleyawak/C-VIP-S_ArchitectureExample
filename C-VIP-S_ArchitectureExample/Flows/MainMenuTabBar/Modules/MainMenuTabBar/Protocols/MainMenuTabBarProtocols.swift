//
//  MainMenuTabBarProtocols.swift
//  C-VIP-S_ArchitectureExample
//
//  Created by Kingsley Edem Awak on 3/27/19.
//  Copyright © 2019 Kingsley Edem Awak. All rights reserved.
//

import UIKit

typealias NavigationControllerCompletion = (UINavigationController) -> ()

protocol MainTabBarModuleProtocol:Module {
   
    var interactor:MainTabBarInteractorProtocol { get set }
    var presenter:MainTabBarPresenterProtocol { get set }
    var view:MainTabBarViewProtocol { get set }
    
    //Coordinator -> Module
    var onLoad:NavigationControllerCompletion? { get set }
    var onProfileFlowSelect: NavigationControllerCompletion? { get set }
    var onMainInformationFlowSelect: NavigationControllerCompletion? { get set }
    
    //Presenter -> Module
    func onLoad(tabNavigationController:UINavigationController)
    func onProfileTabSelected(tabNavigationController:UINavigationController)
    func onMainInformationTabSelected(tabNavigationController:UINavigationController)
}

//Presenter -> View
protocol MainTabBarViewProtocol:View {
    var presenter:MainTabBarPresenterProtocol? { get set }
}

protocol MainTabBarPresenterProtocol:Presenter {
    
    var interactor:MainTabBarInteractorProtocol? { get set }
    var view:MainTabBarViewProtocol? { get set }
    var module:MainTabBarModuleProtocol? { get set }
    
    //View -> Presenter
    func notifyViewLoaded(navigationController:UINavigationController)
    func onProfileTabTapped(navigationController:UINavigationController)
    func onMainInformationTabTapped(navigationController:UINavigationController)
}


protocol MainTabBarInteractorProtocol:Interactor {
    var presenter:MainTabBarPresenterProtocol? { get set }
}
