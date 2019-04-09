//
//  MainInformationMainInformationConfigurator.swift
//  C-VIP-S_ArchitectureExample
//
//  Created by Kingsley Edem Awak on 09/04/2019.
//  Copyright © 2019 New Line Technologies. All rights reserved.
//

import UIKit

class MainInformationModuleConfigurator:ModuleConfigurator {
    
    typealias ModuleType = MainInformationModuleProtocol
    
    class func makeModule() -> MainInformationModuleProtocol {
        let interactor = MainInformationInteractor()
        let presenter = MainInformationPresenter()
        let view = UIStoryboard(name: "MainInformation", bundle: nil).instantiateViewController(withIdentifier: "MainInformationViewController") as! MainInformationViewController
        
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        
        view.presenter = presenter
        
        let module = MainInformationModule(interactor:interactor, presenter:presenter, view:view)
        presenter.module = module
        
        return module
    }

}
