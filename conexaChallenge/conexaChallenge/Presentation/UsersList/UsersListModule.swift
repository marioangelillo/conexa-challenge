//
//  UsersListModule.swift
//  conexaChallenge
//
//  Created by Mario Angelillo on 22/12/2023.
//

import UIKit

class UsersListModule {
    
    static func build() -> UIViewController {
        let view = UsersListViewController()
        let presenter = UsersListPresenter()
        let interactor = UsersListInteractor()
        let router = UsersListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}
