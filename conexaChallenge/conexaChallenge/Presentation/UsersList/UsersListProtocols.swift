//
//  UsersListProtocols.swift
//  conexaChallenge
//
//  Created by Mario Angelillo on 22/12/2023.
//

import Foundation
import UIKit

protocol UsersListViewControllerProtocol: BaseViewControllerProtocol {
    var presenter: UsersListPresenterProtocol? { get set }
    func reloadTableView()
}

protocol UsersListPresenterProtocol {
    var view: UsersListViewControllerProtocol? { get set }
    var interactor: UsersListInteractorProtocol? { get set }
    var router: UsersListRouterProtocol? { get set }
    
    func viewDidLoad()
    func getNumberOfUsers() -> Int
    func getUserItem(index: Int) -> UserEntity
    func didTapCell(nc: UINavigationController, index: Int)
    func onSuccessService(response: [UserEntity])
    func onErrorService(error: String)
}

protocol UsersListInteractorProtocol {
    var presenter: UsersListPresenterProtocol? { get set }
    func getUsersFromService()
}

protocol UsersListRouterProtocol {
    func goToUserLocation(nc: UINavigationController, coordinates: UserLocationEntity)
}
