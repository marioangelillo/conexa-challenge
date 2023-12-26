//
//  NewsListInteractor.swift
//  conexaChallenge
//
//  Created by Mario Angelillo on 22/12/2023.
//

import Foundation

class NewsListInteractor: NewsListInteractorProtocol {
    
    var presenter: NewsListPresenterProtocol?
    
    func getNewsFromService() {
        NewsListService().call { responseDTO in
            let newsArray = responseDTO.map { $0.toEntity() }
            self.presenter?.onSuccessService(response: newsArray)
        } onError: { error in
            self.presenter?.onErrorService(error: error)
        }

    }
    
}
