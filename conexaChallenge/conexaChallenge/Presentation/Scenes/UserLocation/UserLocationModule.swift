//
//  UsersListModule.swift
//  conexaChallenge
//
//  Created by Mario Angelillo on 22/12/2023.
//

import UIKit

class UserLocationModule {
    
    static func build(locationCoordinates: UserLocationEntity) -> UIViewController {
        let view = UserLocationViewController()
        let presenter = UserLocationPresenter(locationCoordinates: locationCoordinates)
        
        view.presenter = presenter
        presenter.locationCoordinates = locationCoordinates
        
        return view
    }
}
