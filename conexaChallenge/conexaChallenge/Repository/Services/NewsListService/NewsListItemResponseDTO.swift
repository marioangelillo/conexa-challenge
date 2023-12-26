//
//  NewsListServiceResponseDTO.swift
//  conexaChallenge
//
//  Created by Mario Angelillo on 25/12/2023.
//

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
