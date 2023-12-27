//
//  NewsListItemResponseDTOTests.swift
//  conexaChallengeTests
//
//  Created by Mario Angelillo on 26/12/2023.
//

import Foundation
import XCTest
@testable import conexaChallenge

class NewsListItemResponseDTOTests: XCTestCase {
    
    func testDecodeFromValidJSON() {
        let jsonString = """
        {"id":1,"slug":"lorem-ipsum","url":"https://jsonplaceholder.org/posts/lorem-ipsum","title":"Lorem ipsum dolor sit amet, consectetur adipiscing elit.","content":"Ante taciti nulla sit libero orci sed nam. Sagittis suspendisse gravida ornare iaculis cras nullam varius ac ullamcorper. Nunc euismod hendrerit netus ligula aptent potenti. Aliquam volutpat nibh scelerisque at. Ipsum molestie phasellus euismod sagittis mauris, erat ut. Gravida morbi, sagittis blandit quis ipsum mi mus semper dictum amet himenaeos. Accumsan non congue praesent interdum habitasse turpis orci. Ante curabitur porttitor ullamcorper sagittis sem donec, inceptos cubilia venenatis ac. Augue fringilla sodales in ullamcorper enim curae; rutrum hac in sociis! Scelerisque integer varius et euismod aenean nulla. Quam habitasse risus nullam enim. Ultrices etiam viverra mattis aliquam? Consectetur velit vel volutpat eget curae;. Volutpat class mus elementum pulvinar! Nisi tincidunt volutpat consectetur. Primis morbi pulvinar est montes diam himenaeos duis elit est orci. Taciti sociis aptent venenatis dui malesuada dui justo faucibus primis consequat volutpat. Rhoncus ante purus eros nibh, id et hendrerit pellentesque scelerisque vehicula sollicitudin quam. Hac class vitae natoque tortor dolor dui praesent suspendisse. Vehicula euismod tincidunt odio platea aenean habitasse neque ad proin. Bibendum phasellus enim fames risus eget felis et sem fringilla etiam. Integer.","image":"https://dummyimage.com/800x430/FFFFFF/lorem-ipsum.png&text=jsonplaceholder.org","thumbnail":"https://dummyimage.com/200x200/FFFFFF/lorem-ipsum.png&text=jsonplaceholder.org","status":"published","category":"lorem","publishedAt":"04/02/2023 13:25:21","updatedAt":"14/03/2023 17:22:20","userId":1}
        """
        
        let data = jsonString.data(using: .utf8)
        let decoder = JSONDecoder()
        let result = try? decoder.decode(NewsListItemResponseDTO.self, from: data!)
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.id, 1)
        XCTAssertEqual(result?.status, "published")
    }
    
    func testDecodeFromInvalidFormat() {
        let jsonString = """
            "id":1,"slug":"lorem-ipsum","url":"https://jsonplaceholder.org/posts/lorem-ipsum","title":"Lorem ipsum dolor sit amet, consectetur adipiscing elit.","content":"Ante taciti nulla sit libero orci sed nam. Sagittis suspendisse gravida ornare iaculis cras nullam varius ac ullamcorper. Nunc euismod hendrerit netus ligula aptent potenti. Aliquam volutpat nibh scelerisque at. Ipsum molestie phasellus euismod sagittis mauris, erat ut. Gravida morbi, sagittis blandit quis ipsum mi mus semper dictum amet himenaeos. Accumsan non congue praesent interdum habitasse turpis orci. Ante curabitur porttitor ullamcorper sagittis sem donec, inceptos cubilia venenatis ac. Augue fringilla sodales in ullamcorper enim curae; rutrum hac in sociis! Scelerisque integer varius et euismod aenean nulla. Quam habitasse risus nullam enim. Ultrices etiam viverra mattis aliquam? Consectetur velit vel volutpat eget curae;. Volutpat class mus elementum pulvinar! Nisi tincidunt volutpat consectetur. Primis morbi pulvinar est montes diam himenaeos duis elit est orci. Taciti sociis aptent venenatis dui malesuada dui justo faucibus primis consequat volutpat. Rhoncus ante purus eros nibh, id et hendrerit pellentesque scelerisque vehicula sollicitudin quam. Hac class vitae natoque tortor dolor dui praesent suspendisse. Vehicula euismod tincidunt odio platea aenean habitasse neque ad proin. Bibendum phasellus enim fames risus eget felis et sem fringilla etiam. Integer.","image":"https://dummyimage.com/800x430/FFFFFF/lorem-ipsum.png&text=jsonplaceholder.org","thumbnail":"https://dummyimage.com/200x200/FFFFFF/lorem-ipsum.png&text=jsonplaceholder.org","status":"published","category":"lorem","publishedAt":"04/02/2023 13:25:21","updatedAt":"14/03/2023 17:22:20","userId":1
        """
        
        let data = jsonString.data(using: .utf8)
        let decoder = JSONDecoder()
        
        XCTAssertThrowsError(try decoder.decode(NewsListItemResponseDTO.self, from: data!)) { error in
                XCTAssertTrue(error is DecodingError)
        }
    }
    
    func testMappingToNewsEntity() {
        // Arrange
        let newsListDTO = [NewsListItemResponseDTO(id: 1, slug: "slug", url: "http1://image1", title: "titulo1", content: "contenido1", image: "http1://image1", thumbnail: "http1://image1/200x200", status: "published", category: "economy", publishedAt: "20-12-2023", updatedAt: "22-12-2023", userId: 1)]
        
        let expectedValue = [NewsEntity(id: 1, title: "titulo1", content: "contenido1", image: "http1://image1", status: "published", category: "economy", publishedAt: "20-12-2023", updatedAt: "22-12-2023")]
        
        // Act
        let newsMappingToEntity = newsListDTO.map { $0.toEntity() }
        
        // Assert
        XCTAssertEqual(expectedValue.count, newsMappingToEntity.count)
        newsMappingToEntity.enumerated().map { (index, element) in
            XCTAssertEqual(expectedValue[index].id, element.id)
            XCTAssertEqual(expectedValue[index].title, element.title)
            XCTAssertEqual(expectedValue[index].content, element.content)
            XCTAssertEqual(expectedValue[index].image, element.image)
            XCTAssertEqual(expectedValue[index].category, element.category)
            XCTAssertEqual(expectedValue[index].status, element.status)
            XCTAssertEqual(expectedValue[index].publishedAt, element.publishedAt)
            XCTAssertEqual(expectedValue[index].updatedAt, element.updatedAt)
        }
    }
}

struct NewsListItemResponseDTO: Decodable {
    let id: Int?
    let slug: String?
    let url: String?
    let title: String?
    let content: String?
    let image: String?
    let thumbnail: String?
    let status: String?
    let category: String?
    let publishedAt: String?
    let updatedAt: String?
    let userId: Int?
    
    func toEntity() -> NewsEntity {
        .init(id: self.id,
              title: self.title,
              content: self.content,
              image: self.image,
              status: self.status,
              category: self.category,
              publishedAt: self.publishedAt,
              updatedAt: self.updatedAt)
    }
}
