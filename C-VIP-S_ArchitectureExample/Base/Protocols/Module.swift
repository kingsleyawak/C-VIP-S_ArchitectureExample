//
//  Module.swift
//  C-VIP-S_ArchitectureExample
//
//  Created by Kingsley Edem Awak on 3/27/19.
//  Copyright © 2019 Kingsley Edem Awak. All rights reserved.
//

import UIKit

protocol Module:class {
    func viewToPresent() -> View
}

// Module reference type wrapper: gives ability to store Module in Swift Collections
// and at the same time keep all internal cross-references of the module weak
// UIViewController.restorationId serves as ModuleReference.identifier
// Should think about this...
class ModuleReference:Hashable {
    var identifier:String
    var module:Module?
    
    init(identifier:String, module:Module? = nil) {
        self.identifier = identifier
        self.module = module
    }
    
    static func ==(lhs: ModuleReference, rhs: ModuleReference) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var hashValue: Int {
        return self.identifier.hashValue
    }
    
}
