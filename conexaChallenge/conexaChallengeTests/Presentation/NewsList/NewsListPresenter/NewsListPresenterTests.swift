//
//  NewsListPresenterTests.swift
//  conexaChallengeTests
//
//  Created by Mario Angelillo on 25/12/2023.
//

import Foundation
import XCTest
@testable import conexaChallenge

class NewsListPresenterTests: XCTestCase, NewsListPresenterProtocol {
//    var view: conexaChallenge.NewsListViewControllerProtocol?
//    
//    var interactor: conexaChallenge.NewsListInteractorProtocol?
//    
//    var router: conexaChallenge.NewsListRouterProtocol?
    
    func viewDidLoad() {
        
    }
    
    func didTapSearchButton(searchText: String) {
        
    }
    
    func getNumberOfNews() -> Int {
        2
    }
    
    func getNewsItem(index: Int) -> NewsEntity {
        NewsEntity(id: 0, title: "", content: "", image: "", status: "", category: "", publishedAt: "", updatedAt: "")
    }
    
    func didTapCell(nc: UINavigationController, index: Int) {
        
    }
    
    func setAllNews() {
        
    }
    
    func onSuccessService(response: [NewsEntity]) {
        
    }
    
    func onErrorService(error: String) {
        
    }
    
    
}
