//
//  ProfileProfilePresenter.swift
//  C-VIP-S_ArchitectureExample
//
//  Created by Kingsley Edem Awak on 29/03/2019.
//  Copyright © 2019 New Line Technologies. All rights reserved.
//

class ProfilePresenter: ProfilePresenterProtocol {

    weak var module: ProfileModuleProtocol?
    weak var interactor: ProfileInteractorProtocol?
    weak var view: ProfileViewProtocol?

}
