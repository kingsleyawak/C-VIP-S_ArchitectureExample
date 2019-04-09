//
//  ProfileProfileModule.swift
//  C-VIP-S_ArchitectureExample
//
//  Created by Kingsley Edem Awak on 29/03/2019.
//  Copyright © 2019 New Line Technologies. All rights reserved.
//

class ProfileModule:ProfileModuleProtocol {
   
    var interactor: ProfileInteractorProtocol
    var presenter: ProfilePresenterProtocol
    var view: ProfileViewProtocol
  
    init(interactor:ProfileInteractorProtocol, presenter:ProfilePresenterProtocol, view:ProfileViewProtocol) {
        self.interactor = interactor
        self.presenter = presenter
        self.view = view
    }

    func viewToPresent() -> View {
        return view
    }
    
}
