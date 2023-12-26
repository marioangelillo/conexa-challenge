//
//  NewsListModule.swift
//  conexaChallenge
//
//  Created by Mario Angelillo on 22/12/2023.
//

import Foundation
import UIKit

class NewsListModule {
    
    static func build() -> UIViewController {
        let view = NewsListViewController()
        let presenter = NewsListPresenter()
        let interactor = NewsListInteractor()
        let router = NewsListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
}
