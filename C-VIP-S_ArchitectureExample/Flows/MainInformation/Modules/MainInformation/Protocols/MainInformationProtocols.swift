//
//  MainInformationMainInformationProtocols.swift
//  C-VIP-S_ArchitectureExample
//
//  Created by Kingsley Edem Awak on 09/04/2019.
//  Copyright © 2019 New Line Technologies. All rights reserved.
//

protocol MainInformationModuleProtocol: Module {
    
    var interactor:MainInformationInteractorProtocol { get set }
    var presenter:MainInformationPresenterProtocol { get set }
    var view:MainInformationViewProtocol { get set }
}

protocol MainInformationViewProtocol:View {
    var presenter:MainInformationPresenterProtocol? { get set }
}

protocol MainInformationPresenterProtocol:Presenter {
    
    var interactor:MainInformationInteractorProtocol? { get set }
    var view:MainInformationViewProtocol? { get set }
    var module:MainInformationModuleProtocol? { get set }
}


protocol MainInformationInteractorProtocol:Interactor {
    var presenter:MainInformationPresenterProtocol? { get set }
}
