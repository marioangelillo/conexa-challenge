//
//  UsersListPresenter.swift
//  conexaChallenge
//
//  Created by Mario Angelillo on 22/12/2023.
//

import Foundation
import UIKit

class UsersListPresenter: UsersListPresenterProtocol {
    
    var view: UsersListViewControllerProtocol?
    var interactor: UsersListInteractorProtocol?
    var router: UsersListRouterProtocol?
    
    private var users: [UserEntity] = [] {
        didSet {
            view?.reloadTableView()
        }
    }
    
    func viewDidLoad() {
        view?.showLoader()
        interactor?.getUsersFromService()
    }
    
    func getNumberOfUsers() -> Int {
        users.count
    }
    
    func getUserItem(index: Int) -> UserEntity {
        return users[index]
    }
    
    func didTapCell(nc: UINavigationController, index: Int) {
        let location = users[index].getGeolocation()
        router?.goToUserLocation(nc: nc, coordinates: location)
    }
    
    func onSuccessService(response: [UserEntity]) {
        view?.hideLoader()
        users = response
    }
    
    func onErrorService(error: String) {
        view?.hideLoader()
        view?.showError(errorDescription: error)
    }
    
}
