//
//  NewsListServiceProtocol.swift
//  conexaChallenge
//
//  Created by Mario Angelillo on 26/12/2023.
//

import Foundation

protocol NewsListServiceProtocol {
    func call(onSuceess: @escaping([NewsListItemResponseDTO]) -> Void, onError: @escaping(String) -> Void)
}
