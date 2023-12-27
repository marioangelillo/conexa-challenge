//
//  NewsListEntityTests.swift
//  conexaChallengeTests
//
//  Created by Mario Angelillo on 26/12/2023.
//

import Foundation
import XCTest
@testable import conexaChallenge

class NewsListEntityTests: XCTestCase {
    
    var newsEntityWithNilValues: NewsEntity!
    var newsEntityWithNotNilValues: NewsEntity!
    
    override func setUp() {
        newsEntityWithNilValues = NewsEntity(id: nil, title: nil, content: nil, image: nil, status: nil, category: nil, publishedAt: nil, updatedAt: nil)
        
        newsEntityWithNotNilValues = NewsEntity(id: 1, title: "Titulo1", content: "Contenido1", image: "http://lorem.com/image1", status: "published", category: "lorem", publishedAt: "12-02-2023", updatedAt: "20-06-2023")
    }
    
    func testNewsEntityWhenIsNil() {
        XCTAssertNotNil(newsEntityWithNilValues.id)
        XCTAssertNotNil(newsEntityWithNilValues.title)
        XCTAssertNotNil(newsEntityWithNilValues.content)
        XCTAssertNotNil(newsEntityWithNilValues.image)
        XCTAssertNotNil(newsEntityWithNilValues.status)
        XCTAssertNotNil(newsEntityWithNilValues.category)
        XCTAssertNotNil(newsEntityWithNilValues.publishedAt)
        XCTAssertNotNil(newsEntityWithNilValues.updatedAt)
    }
    
    func testNewsEntityValuesWithNilValues() {
        XCTAssertEqual(newsEntityWithNilValues.id, 0)
        XCTAssertEqual(newsEntityWithNilValues.title, "Título no disponible")
        XCTAssertEqual(newsEntityWithNilValues.content, "Contenido no disponible")
        XCTAssertEqual(newsEntityWithNilValues.image, "newspaper")
        XCTAssertEqual(newsEntityWithNilValues.status, "Estado publicación no disponible")
        XCTAssertEqual(newsEntityWithNilValues.category, "Categoría no disponible")
        XCTAssertEqual(newsEntityWithNilValues.publishedAt, "Fecha de publicación no disponible")
        XCTAssertEqual(newsEntityWithNilValues.updatedAt, "")
    }
    
    func testNewsEntityWhenIsNotNil() {
        XCTAssertNotNil(newsEntityWithNotNilValues.id)
        XCTAssertNotNil(newsEntityWithNotNilValues.title)
        XCTAssertNotNil(newsEntityWithNotNilValues.content)
        XCTAssertNotNil(newsEntityWithNotNilValues.image)
        XCTAssertNotNil(newsEntityWithNotNilValues.status)
        XCTAssertNotNil(newsEntityWithNotNilValues.category)
        XCTAssertNotNil(newsEntityWithNotNilValues.publishedAt)
        XCTAssertNotNil(newsEntityWithNotNilValues.updatedAt)
    }
    
    func testNewsEntityValuesWithNotNilValues() {
        XCTAssertEqual(newsEntityWithNotNilValues.id, 1)
        XCTAssertEqual(newsEntityWithNotNilValues.title, "Titulo1")
        XCTAssertEqual(newsEntityWithNotNilValues.content, "Contenido1")
        XCTAssertEqual(newsEntityWithNotNilValues.image, "http://lorem.com/image1")
        XCTAssertEqual(newsEntityWithNotNilValues.status, "published")
        XCTAssertEqual(newsEntityWithNotNilValues.category, "lorem")
        XCTAssertEqual(newsEntityWithNotNilValues.publishedAt, "12-02-2023")
        XCTAssertEqual(newsEntityWithNotNilValues.updatedAt, "20-06-2023")
    }
    
    override func tearDown() {
        newsEntityWithNilValues = nil
        newsEntityWithNotNilValues = nil
    }
}

