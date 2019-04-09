//
//  ProfileProfileProtocols.swift
//  C-VIP-S_ArchitectureExample
//
//  Created by Kingsley Edem Awak on 29/03/2019.
//  Copyright © 2019 New Line Technologies. All rights reserved.
//

protocol ProfileModuleProtocol: Module {
    
    var interactor:ProfileInteractorProtocol { get set }
    var presenter:ProfilePresenterProtocol { get set }
    var view:ProfileViewProtocol { get set }
}

protocol ProfileViewProtocol:View {
    var presenter:ProfilePresenterProtocol? { get set }
}

protocol ProfilePresenterProtocol:Presenter {
    
    var interactor:ProfileInteractorProtocol? { get set }
    var view:ProfileViewProtocol? { get set }
    var module:ProfileModuleProtocol? { get set }
}


protocol ProfileInteractorProtocol:Interactor {
    var presenter:ProfilePresenterProtocol? { get set }
}
