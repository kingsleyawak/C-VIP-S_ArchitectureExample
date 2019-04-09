//
//  ProfileProfileConfigurator.swift
//  C-VIP-S_ArchitectureExample
//
//  Created by Kingsley Edem Awak on 29/03/2019.
//  Copyright © 2019 New Line Technologies. All rights reserved.
//

import UIKit

class ProfileModuleConfigurator:ModuleConfigurator {
    
    typealias ModuleType = ProfileModuleProtocol
    
    class func makeModule() -> ProfileModuleProtocol {
        let interactor = ProfileInteractor()
        let presenter = ProfilePresenter()
        let view = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        
        view.presenter = presenter
        
        let module = ProfileModule(interactor:interactor, presenter:presenter, view:view)
        presenter.module = module
        
        return module
    }

}
