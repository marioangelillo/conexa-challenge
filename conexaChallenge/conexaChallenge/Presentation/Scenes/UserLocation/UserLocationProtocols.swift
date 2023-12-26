//
//  UserListProtocols.swift
//  conexaChallenge
//
//  Created by Mario Angelillo on 22/12/2023.
//

import Foundation

protocol UserLocationViewControllerProtocol {
    var presenter: UserLocationPresenterProtocol? { get set }
}

protocol UserLocationPresenterProtocol {
    func getLocation() -> UserLocationEntity
}
