//
//  NewsDetailsProtocols.swift
//  conexaChallenge
//
//  Created by Mario Angelillo on 22/12/2023.
//

import Foundation

protocol NewsDetailsViewControllerProtocol {
    var presenter: NewsDetailsPresenterProtocol? { get set }
}

protocol NewsDetailsPresenterProtocol {
    func getImageUrl() -> String
    func getTitle() -> String
    func getContent() -> String
    func getCategory() -> String
    func getPublicationDate() -> String
}
