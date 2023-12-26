//
//  NewsDetailsPresenter.swift
//  conexaChallenge
//
//  Created by Mario Angelillo on 22/12/2023.
//

import Foundation

class NewsDetailsPresenter: NewsDetailsPresenterProtocol {
    
    let news: NewsEntity
    
    init(news: NewsEntity) {
        self.news = news
    }
    
    func getImageUrl() -> String {
        news.image
    }
    
    func getTitle() -> String {
        news.title
    }
    
    func getContent() -> String {
        news.content
    }
    
    func getCategory() -> String {
        return "Categoría: " + news.category
    }
    
    func getPublicationDate() -> String {
        return "Fecha de publicación: " + news.publishedAt
    }
    
}
