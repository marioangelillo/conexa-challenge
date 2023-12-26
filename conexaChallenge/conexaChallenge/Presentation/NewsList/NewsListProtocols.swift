//
//  NewsListProtocols.swift
//  conexaChallenge
//
//  Created by Mario Angelillo on 22/12/2023.
//

import Foundation
import UIKit

protocol NewsListViewControllerProtocol: BaseViewControllerProtocol {
    var presenter: NewsListPresenterProtocol? { get set }
    func reloadTableView()
}

protocol NewsListPresenterProtocol {
//    var view: NewsListViewControllerProtocol? { get set }
//    var interactor: NewsListInteractorProtocol? { get set }
//    var router: NewsListRouterProtocol? { get set }
    
    func viewDidLoad()
    func didTapSearchButton(searchText: String)
    func getNumberOfNews() -> Int
    func getNewsItem(index: Int) -> NewsEntity
    func didTapCell(nc: UINavigationController, index: Int)
    func setAllNews()
    func onSuccessService(response: [NewsEntity])
    func onErrorService(error: String)
}

protocol NewsListInteractorProtocol {
    var presenter: NewsListPresenterProtocol? { get set }
    func getNewsFromService()
}

protocol NewsListRouterProtocol {
    func goToNewsDetail(nc: UINavigationController, news: NewsEntity)
}
