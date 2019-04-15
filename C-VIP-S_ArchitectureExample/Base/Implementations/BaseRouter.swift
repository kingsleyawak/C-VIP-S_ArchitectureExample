//
//  BaseRouter.swift
//  C-VIP-S_ArchitectureExample
//
//  Created by Kingsley Edem Awak on 3/27/19.
//  Copyright © 2019 Kingsley Edem Awak. All rights reserved.
//

import UIKit


class BaseRouter:Router {
    
    var rootNavigationController:UINavigationController
    private var completions: [UIViewController : BaseCompletion]
    
    init(rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
        completions = [:]
    }
    
    func present(_ module: Module) {
        present(module, animated: true)
    }
    
    func present(_ module: Module, animated: Bool) {
        guard let controller = module.viewToPresent() as? UIViewController else { return }
        rootNavigationController.present(controller, animated: animated, completion: nil)
    }
    
    func dismiss(completion: BaseCompletion?) {
        dismiss(animated: true, completion: nil)
    }
    
    func dismiss(animated: Bool, completion: BaseCompletion?) {
        rootNavigationController.dismiss(animated: animated, completion: completion)
    }
    
    func setAsRoot(_ module: Module) {
        setAsRoot(module, animated: false, hideNavigationBar: false)
    }
    
    func setAsRoot(_ module: Module, animated: Bool, hideNavigationBar: Bool) {
        guard let controller = module.viewToPresent() as? UIViewController else { return }
        
        rootNavigationController.setViewControllers([controller], animated: animated)
        rootNavigationController.isNavigationBarHidden = hideNavigationBar
    }
    
    func push(_ module: Module, completion: BaseCompletion?) {
        push(module, animated: true, hideBottomBar: false, completion: completion)
    }
    
    func push(_ module: Module, animated: Bool, hideBottomBar: Bool, completion: BaseCompletion?) {
       guard let controller = module.viewToPresent() as? UIViewController, (controller is UINavigationController == false) else { return }
        
        if let completion = completion {
            completions[controller] = completion
        }
        
        controller.hidesBottomBarWhenPushed = hideBottomBar
        rootNavigationController.pushViewController(controller, animated: animated)
    }
    
    func popModule() {
        popModule(animated: true)
    }
    
    func popModule(animated: Bool) {
        if let removedController = rootNavigationController.popViewController(animated: animated) {
            runCompletion(for: removedController)
        }
    }
    
    func popToRootModule() {
        popToRootModule(animated: true)
    }
    
    func popToRootModule(animated: Bool) {
        if let removedControllers = rootNavigationController.popToRootViewController(animated: animated) {
            removedControllers.forEach { controller in
                runCompletion(for: controller)
            }
        }
    }
    
    private func runCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else { return }
        completion()
        completions.removeValue(forKey: controller)
    }
    
}
