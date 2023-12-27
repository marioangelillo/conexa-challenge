//
//  NewsListPresenterTests.swift
//  conexaChallengeTests
//
//  Created by Mario Angelillo on 25/12/2023.
//

import Foundation
import XCTest
@testable import conexaChallenge

class NewsListPresenterTests: XCTestCase {
    var presenter: NewsListPresenter!
    var viewMock = NewsListViewControllerMock()
    var interactorMock = NewsListInteractorMock()
    var routerMock = NewsListRouterMock()
    
    let fakeNews = [NewsEntity(id: 1, title: "Titulo1", content: "Contenido1", image: "http://lorem.com/image1", status: "published", category: "lorem", publishedAt: "12-02-2023", updatedAt: "20-06-2023"), NewsEntity(id: 2, title: "Titulo2", content: "Contenido2", image: "http://lorem.com/image2", status: "not published", category: "economy", publishedAt: "11-11-2021", updatedAt: "20-12-2023")]
    
    override func setUp() {
        presenter = NewsListPresenter()
        presenter.view = viewMock
        presenter.interactor = interactorMock
        presenter.router = routerMock
        interactorMock.presenter = presenter
    }
    
    func testViewDidLoad() {
        // Arrange
        presenter.viewDidLoad()
        // Act
        let news = presenter.news
        let allNews = presenter.allNews

        // Assert
        XCTAssertEqual(news.count, 2)
        XCTAssertEqual(news[0].title, allNews[0].title)
        XCTAssertFalse(allNews.isEmpty)
        XCTAssert(viewMock.showLoaderCalled)
        XCTAssert(interactorMock.getNewsFromServiceCalled)
    }
    
    func testDidTapSearchButton() {
        // Arrange
        presenter.allNews = fakeNews
        // Act
        presenter.didTapSearchButton(searchText: "Contenido2")
        // Assert
        XCTAssertEqual(presenter.news.count, 1)
    }
    
    func testGetNumberOfNews() {
        // Arrange
        presenter.news = fakeNews
        // Act
        let numberOfNews = presenter.getNumberOfNews()
        // Assert
        XCTAssertEqual(numberOfNews, 2)
    }
    
    func testGetNewsItem() {
        // Arrange
        presenter.news = fakeNews
        // Act
        let newsItem = presenter.getNewsItem(index: 0)
        // Arrange
        XCTAssertEqual(newsItem.title, fakeNews[0].title)
        XCTAssertEqual(newsItem.content, fakeNews[0].content)
        XCTAssertEqual(newsItem.image, fakeNews[0].image)
        XCTAssertEqual(newsItem.category, fakeNews[0].category)
        XCTAssertEqual(newsItem.status, fakeNews[0].status)
        XCTAssertEqual(newsItem.publishedAt, fakeNews[0].publishedAt)
        XCTAssertEqual(newsItem.updatedAt, fakeNews[0].updatedAt)
    }

    func testDidTapCell() {
        // Arrange
        presenter.news = fakeNews
        let index = 0

        // Act
        presenter.didTapCell(nc: UINavigationController(), index: index)

        // Assert
        XCTAssertTrue(routerMock.goToNewsDetailCalled)
        XCTAssertEqual(routerMock.newsPassedToGoToNewsDetail?.title, fakeNews[index].title)
        XCTAssertEqual(routerMock.newsPassedToGoToNewsDetail?.content, fakeNews[index].content)
    }
    
    func testSetAllNews() {
        // Arrange
        presenter.allNews = fakeNews
        // Act
        presenter.setAllNews()
        let news = presenter.news
        // Assert
        XCTAssertEqual(news[0].title, fakeNews[0].title)
        XCTAssertEqual(news[0].content, fakeNews[0].content)
        XCTAssertEqual(news[0].image, fakeNews[0].image)
        XCTAssertEqual(news[0].category, fakeNews[0].category)
        XCTAssertEqual(news[0].status, fakeNews[0].status)
        XCTAssertEqual(news[0].publishedAt, fakeNews[0].publishedAt)
        XCTAssertEqual(news[0].updatedAt, fakeNews[0].updatedAt)
    }
    
    func testOnSuccesService() {
        // Arrange
        let news = fakeNews
        // Act
        presenter.onSuccessService(response: news)
        //Assert
        XCTAssertEqual(news.count, 2)
        XCTAssertEqual(news[0].title, presenter.allNews[0].title)
        XCTAssertFalse(presenter.allNews.isEmpty)
    }
    
    func testOnErrorService() {
        let error = "Error"
        presenter.onErrorService(error: error)
        XCTAssert(viewMock.hideLoaderCalled)
    }
    
    override func tearDown() {
        presenter = nil
    }
}

// MARK: ViewMock

class NewsListViewControllerMock: NewsListViewControllerProtocol {
    var presenter: NewsListPresenterProtocol?
    var reloadTableViewCalled = false
    var showLoaderCalled = false
    var hideLoaderCalled = false
    
    func reloadTableView() {
        reloadTableViewCalled = true
    }
    
    var loader: UIAlertController?
    
    func showLoader() {
        showLoaderCalled = true
    }
    
    func hideLoader() {
        hideLoaderCalled = true
    }
}

// MARK: InteractorMock

class NewsListInteractorMock: NewsListInteractorProtocol {
    
    var presenter: NewsListPresenterProtocol?
    var getNewsFromServiceCalled = false
    let fakeNews = [NewsEntity(id: 1, title: "Titulo1", content: "Contenido1", image: "http://lorem.com/image1", status: "published", category: "lorem", publishedAt: "12-02-2023", updatedAt: "20-06-2023"), NewsEntity(id: 2, title: "Titulo2", content: "Contenido2", image: "http://lorem.com/image2", status: "not published", category: "economy", publishedAt: "11-11-2021", updatedAt: "20-12-2023")]
    
    func getNewsFromService() {
        getNewsFromServiceCalled = true
        presenter?.onSuccessService(response: fakeNews)
    }
}

class NewsListRouterMock: NewsListRouterProtocol {
    var goToNewsDetailCalled = false
    var newsPassedToGoToNewsDetail: NewsEntity?

    func goToNewsDetail(nc: UINavigationController, news: NewsEntity) {
        goToNewsDetailCalled = true
        newsPassedToGoToNewsDetail = news
    }
}
