//
//  NewsListPresenter.swift
//  conexaChallenge
//
//  Created by Mario Angelillo on 22/12/2023.
//

import Foundation
import UIKit

class NewsListPresenter: NewsListPresenterProtocol {
    
    var view: NewsListViewControllerProtocol?
    var router: NewsListRouterProtocol?
    var interactor: NewsListInteractorProtocol?
    
    private var allNews = [NewsEntity]()
    
    private var news: [NewsEntity] = [] {
        didSet {
            view?.reloadTableView()
        }
    }
    
    func didTapSearchButton(searchText: String) {
        news = allNews.filter { news in
            return news.title.lowercased().contains(searchText) ||
            news.content.lowercased().contains(searchText)
        }
    }
    
    func viewDidLoad() {
        view?.showLoader()
        interactor?.getNewsFromService()
    }
    
    func getNumberOfNews() -> Int {
        return news.count
    }
    
    func didTapCell(nc: UINavigationController, index: Int) {
        router?.goToNewsDetail(nc: nc, news: news[index])
    }
    
    func getNewsItem(index: Int) -> NewsEntity {
        return news[index]
    }
    
    func setAllNews() {
        news = allNews
    }
    
    func onSuccessService(response: [NewsEntity]) {
        view?.hideLoader()
        self.allNews = response
        self.news = response
    }
    
    func onErrorService(error: String) {
        view?.hideLoader()
        print(error)
    }
    
}
