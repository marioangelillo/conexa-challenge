//
//  UsersListServiceProtocol.swift
//  conexaChallenge
//
//  Created by Mario Angelillo on 26/12/2023.
//

import Foundation

protocol UsersListServiceProtocol {
    func call(onSuceess: @escaping([UsersListItemResponseDTO]) -> Void, onError: @escaping(String) -> Void)
}
