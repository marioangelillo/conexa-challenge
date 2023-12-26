//
//  NewsListRouter.swift
//  conexaChallenge
//
//  Created by Mario Angelillo on 22/12/2023.
//

import UIKit

class NewsListRouter: NewsListRouterProtocol {
    
    func goToNewsDetail(nc: UINavigationController, news: NewsEntity) {
        let newsDetailViewController = NewsDetailsModule.build(news: news)
        nc.pushViewController(newsDetailViewController, animated: true)
    }
    
}
