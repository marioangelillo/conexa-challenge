//
//  UsersListRouter.swift
//  conexaChallenge
//
//  Created by Mario Angelillo on 22/12/2023.
//

import UIKit

class UsersListRouter: UsersListRouterProtocol {
    
    func goToUserLocation(nc: UINavigationController, coordinates: UserLocationEntity) {
        let vc = UserLocationModule.build(locationCoordinates: coordinates)
        nc.pushViewController(vc, animated: true)
    }
    
}
