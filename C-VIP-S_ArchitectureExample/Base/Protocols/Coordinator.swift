//
//  Coordinator.swift
//  C-VIP-S_ArchitectureExample
//
//  Created by dev on 3/20/19.
//  Copyright © 2019 New Line Technologies. All rights reserved.
//


protocol Coordinator: class {
    
    var router:Router { get set }
    var childCoordinators: [Coordinator] { get set }
    
    func start()
    func addDependency(_ coordinator: Coordinator)
    func removeDependency(_ coordinator: Coordinator)
}
