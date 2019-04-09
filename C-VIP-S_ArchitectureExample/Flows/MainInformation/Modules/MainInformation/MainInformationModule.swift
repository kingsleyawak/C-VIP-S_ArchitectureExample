//
//  MainInformationMainInformationModule.swift
//  C-VIP-S_ArchitectureExample
//
//  Created by Kingsley Edem Awak on 09/04/2019.
//  Copyright © 2019 New Line Technologies. All rights reserved.
//

class MainInformationModule:MainInformationModuleProtocol {
   
    var interactor: MainInformationInteractorProtocol
    var presenter: MainInformationPresenterProtocol
    var view: MainInformationViewProtocol
  
    init(interactor:MainInformationInteractorProtocol, presenter:MainInformationPresenterProtocol, view:MainInformationViewProtocol) {
        self.interactor = interactor
        self.presenter = presenter
        self.view = view
    }

    func viewToPresent() -> View {
        return view
    }
    
}
