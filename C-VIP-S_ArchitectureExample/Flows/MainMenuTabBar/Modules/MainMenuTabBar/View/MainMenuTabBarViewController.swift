//
//  MainMenuTabBarMainMenuTabBarViewController.swift
//  C-VIP-S_ArchitectureExample
//
//  Created by Kingsley Edem Awak on 27/03/2019.
//  Copyright © 2019 New Line Technologies. All rights reserved.
//

import UIKit

enum MainMenuBarTabs:Int {
    case mainInfo = 0
    case profile = 1
}

class MainMenuTabBarViewController: UITabBarController, UITabBarControllerDelegate, MainTabBarViewProtocol {

    weak var presenter: MainTabBarPresenterProtocol?
    var defaultSelectBar:MainMenuBarTabs = .mainInfo
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        
        selectedIndex = defaultSelectBar.rawValue
        
        if let controller = viewControllers?[selectedIndex] as? UINavigationController {
            presenter?.notifyViewLoaded(navigationController: controller)
        }
    }

    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let controller = viewControllers?[selectedIndex] as? UINavigationController else { return }
        
        switch selectedIndex {
        case 0: mainInfoTabTapped(navigationController: controller)
        case 1: profileTabTapped(navigationController: controller)
   
        default: break
        }
    }
    
}

//MARK:MainTabBarViewProtocol
extension MainMenuTabBarViewController {
    
    func mainInfoTabTapped(navigationController: UINavigationController) {
        presenter?.onMainInformationTabTapped(navigationController: navigationController)
    }
    
    func profileTabTapped(navigationController: UINavigationController) {
        presenter?.onProfileTabTapped(navigationController: navigationController)
    }
    
}
