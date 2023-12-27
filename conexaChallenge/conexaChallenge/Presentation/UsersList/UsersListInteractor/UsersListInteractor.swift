//
//  UsersListInteractor.swift
//  conexaChallenge
//
//  Created by Mario Angelillo on 22/12/2023.
//

import Foundation

class UsersListInteractor: UsersListInteractorProtocol {
    
    var presenter: UsersListPresenterProtocol?
    let service: UsersListServiceProtocol
    
    init(service: UsersListServiceProtocol = UsersListService()) {
        self.service = service
    }
    
    func getUsersFromService() {
        service.call { response in
            let usersArray = response.map { $0.toEntity() }
            self.presenter?.onSuccessService(response: usersArray)
        } onError: { error in
            self.presenter?.onErrorService(error: error)
        }
    }
}
