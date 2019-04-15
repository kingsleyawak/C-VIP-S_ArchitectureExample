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
    var activeModules: Set<ModuleReference> = []
    
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
        addModuleToActiveModules(module: module)
    }
    
    func dismiss(completion: BaseCompletion?) {
        dismiss(animated: true, completion: nil)
    }
    
    func dismiss(animated: Bool, completion: BaseCompletion?) {
        rootNavigationController.dismiss(animated: animated, completion: completion)
        removeAllActiveModules()
    }
    
    func setAsRoot(_ module: Module) {
        setAsRoot(module, animated: false, hideNavigationBar: false)
    }
    
    func setAsRoot(_ module: Module, animated: Bool, hideNavigationBar: Bool) {
        guard let controller = module.viewToPresent() as? UIViewController else { return }
        
        rootNavigationController.setViewControllers([controller], animated: animated)
        rootNavigationController.isNavigationBarHidden = hideNavigationBar
        addModuleToActiveModules(module: module)
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
        addModuleToActiveModules(module: module)
    }
    
    func popModule() {
        popModule(animated: true)
    }
    
    func popModule(animated: Bool) {
        if let removedController = rootNavigationController.popViewController(animated: animated) {
            runCompletion(for: removedController)
            removeModuleFromActiveModules(viewController: removedController)
        }
    }
    
    func popToRootModule() {
        popToRootModule(animated: true)
    }
    
    func popToRootModule(animated: Bool) {
        if let removedControllers = rootNavigationController.popToRootViewController(animated: animated) {
            removedControllers.forEach { controller in
                runCompletion(for: controller)
                removeModuleFromActiveModules(viewController: controller)
            }
        }
    }
    
    private func runCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else { return }
        completion()
        completions.removeValue(forKey: controller)
    }
    
    //MARK: Memory Management
    
    // Adding module to active modules set to keep it in memory
    private func addModuleToActiveModules(module:Module) {
        guard let controller = module.viewToPresent() as? UIViewController, let identifier = controller.restorationIdentifier else {
            return
        }
        let moduleReference = ModuleReference(identifier: identifier, module: module)
        activeModules.insert(moduleReference)
    }
    
    // Removing module from active modules set to release it from memory
    private func removeModuleFromActiveModules(viewController:UIViewController) {
        guard let identifier = viewController.restorationIdentifier else { return }
        
        let moduleReference = ModuleReference(identifier: identifier)
        activeModules.remove(moduleReference)
    }
    
    private func removeAllActiveModules() {
        activeModules.removeAll()
    }
    
}
