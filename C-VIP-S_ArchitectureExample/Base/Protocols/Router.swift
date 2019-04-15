//
//  Router.swift
//  C-VIP-S_ArchitectureExample
//
//  Created by dev on 3/21/19.
//  Copyright © 2019 New Line Technologies. All rights reserved.
//

import UIKit

protocol Router {
    
    var rootNavigationController:UINavigationController { get set }
    var activeModules:Set<ModuleReference> { get set }
    
    func present(_ module: Module)
    func present(_ module: Module, animated: Bool)
    
    func dismiss(completion:BaseCompletion?)
    func dismiss(animated: Bool, completion:BaseCompletion?)
    
    func setAsRoot(_ module:Module)
    func setAsRoot(_ module:Module, animated: Bool, hideNavigationBar: Bool)
    
    func push(_ module:Module, completion:BaseCompletion?)
    func push(_ module:Module, animated: Bool, hideBottomBar:Bool, completion:BaseCompletion?)
    
    func popModule()
    func popModule(animated: Bool)
    
    func popToRootModule()
    func popToRootModule(animated: Bool)
}
