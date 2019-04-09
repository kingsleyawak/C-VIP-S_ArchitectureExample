//
//  ModuleConfigurator.swift
//  C-VIP-S_ArchitectureExample
//
//  Created by Kingsley Edem Awak on 3/27/19.
//  Copyright © 2019 Kingsley Edem Awak. All rights reserved.
//

import Foundation

protocol ModuleConfigurator {
    associatedtype ModuleType
    static func makeModule() -> ModuleType
}
