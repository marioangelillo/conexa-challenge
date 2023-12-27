//
//  NewsListInteractorTests.swift
//  conexaChallengeTests
//
//  Created by Mario Angelillo on 26/12/2023.
//

import Foundation
import XCTest
@testable import conexaChallenge

class NewsListInteractorTests: XCTestCase {
    
    func testGetNewsFromService_Success() {
        
        // Arrange
        let newsListServiceMock = NewsListServiceMock(withError: false)
        let interactor = NewsListInteractor(service: newsListServiceMock)
        let presenter = NewsListPresenterMock()
        interactor.presenter = presenter
        
        // Act
        interactor.getNewsFromService()
        
        // Assert
        XCTAssertTrue(presenter.onSuccessServiceCalled)
        
    }
    
    func testGetNewsFromService_Error() {
    
        // Arrange
        let newsListServiceMock = NewsListServiceMock(withError: true)
        let interactor = NewsListInteractor(service: newsListServiceMock)
        let presenterMock = NewsListPresenterMock()
        interactor.presenter = presenterMock
        
        // Act
        interactor.getNewsFromService()
        
        // Assert
        XCTAssertTrue(presenterMock.onErrorServiceCalled)
    }
}


class NewsListServiceMock: NewsListServiceProtocol {
    
    let newsListDTO = [NewsListItemResponseDTO(id: 1, slug: "slug", url: "http1://image1", title: "titulo1", content: "contenido1", image: "http1://image1", thumbnail: "http1://image1/200x200", status: "published", category: "economy", publishedAt: "20-12-2023", updatedAt: "22-12-2023", userId: 1)]
    
    let withError: Bool
    
    init(withError: Bool) {
        self.withError = withError
    }
    
    func call(onSuceess: @escaping ([NewsListItemResponseDTO]) -> Void, onError: @escaping (String) -> Void) {
        if withError {
            onError("Error al llamar el servicio")
        } else {
            onSuceess(newsListDTO)
        }
    }
    
}

class NewsListPresenterMock: NewsListPresenterProtocol {
    
    var view: NewsListViewControllerProtocol?
    var interactor: NewsListInteractorProtocol?
    var router: NewsListRouterProtocol?
    
    func viewDidLoad() {
        
    }
    
    func didTapSearchButton(searchText: String) {
        
    }
    
    func getNumberOfNews() -> Int {
        return 0
    }
    
    func getNewsItem(index: Int) -> NewsEntity {
        NewsEntity(id: nil, title: nil, content: nil, image: nil, status: nil, category: nil, publishedAt: nil, updatedAt: nil)
    }
    
    func didTapCell(nc: UINavigationController, index: Int) {
        
    }
    
    func setAllNews() {
        
    }
    
    var onSuccessServiceCalled = false
    func onSuccessService(response: [NewsEntity]) {
        onSuccessServiceCalled = true
    }
    
    var onErrorServiceCalled = false
    func onErrorService(error: String) {
        onErrorServiceCalled = true
    }
    
}
