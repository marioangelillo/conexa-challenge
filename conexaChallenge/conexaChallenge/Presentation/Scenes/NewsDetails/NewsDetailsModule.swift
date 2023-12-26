//
//  NewsDetailsModule.swift
//  conexaChallenge
//
//  Created by Mario Angelillo on 22/12/2023.
//

import UIKit

class NewsDetailsModule {
    
    static func build(news: NewsEntity) -> UIViewController {
        let view = NewsDetailsViewController()
        let presenter = NewsDetailsPresenter(news: news)
        
        view.presenter = presenter
        
        return view
    }
    
}
