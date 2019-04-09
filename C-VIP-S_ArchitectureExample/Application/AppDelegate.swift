//
//  AppDelegate.swift
//  C-VIP-S_ArchitectureExample
//
//  Created by Kingsley Edem Awak on 3/27/19.
//  Copyright © 2019 Kingsley Edem Awak. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootNavigationController: UINavigationController { return self.window!.rootViewController as! UINavigationController }

    private lazy var applicationCoordinator:ApplicationCoordinator = self.makeApplicationCoordinator()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        applicationCoordinator.start(with: .defaultOpening)
        return true
    }
    
    private func makeApplicationCoordinator() -> ApplicationCoordinator {
        return ApplicationCoordinator(router: BaseRouter(rootNavigationController: rootNavigationController) )
    }

}

