//
//  NewsListEntity.swift
//  conexaChallenge
//
//  Created by Mario Angelillo on 22/12/2023.
//

import Foundation

struct NewsEntity {
    let id: Int
    let title: String
    let content: String
    let image: String
    let status: String
    let category: String
    let publishedAt: String
    let updatedAt: String
    
    init(id: Int?,
         title: String?,
         content: String?,
         image: String?,
         status: String?,
         category: String?,
         publishedAt: String?,
         updatedAt: String?)
    {
        self.id = id ?? 0
        self.title = title ?? "Título no disponible"
        self.content = content ?? "Contenido no disponible"
        self.image = image ?? "newspaper"
        self.status = status ?? "Estado publicación no disponible"
        self.category = category ?? "Categoría no disponible"
        self.publishedAt = publishedAt ?? "Fecha de publicación no disponible"
        self.updatedAt = updatedAt ?? ""
    }
}
