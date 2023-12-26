//
//  UserDetailsPresenter.swift
//  conexaChallenge
//
//  Created by Mario Angelillo on 22/12/2023.
//

import Foundation

class UserLocationPresenter: UserLocationPresenterProtocol {
    
    var locationCoordinates: UserLocationEntity
    
    init(locationCoordinates: UserLocationEntity) {
        self.locationCoordinates = locationCoordinates
    }
    
    func getLocation() -> UserLocationEntity {
        return locationCoordinates
    }
    
}
