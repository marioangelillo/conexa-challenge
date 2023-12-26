//
//  UsersListServiceResponseDTO.swift
//  conexaChallenge
//
//  Created by Mario Angelillo on 25/12/2023.
//

import Foundation

struct UsersListItemResponseDTO: Decodable {
    let id: Int?
    let firstname: String?
    let lastname: String?
    let email: String?
    let birthDate: String?
    let address: AddressDTO?
    
    struct AddressDTO: Decodable {
        let street: String?
        let suite: String?
        let city: String?
        let zipcode: String?
        let geo: GeolocationDTO?

        struct GeolocationDTO: Decodable {
            let lat: String?
            let lng: String?
        }
    }
    
    func toEntity() -> UserEntity {
        .init(id: self.id,
              firstname: self.firstname,
              lastname: self.lastname,
              street: self.address?.street,
              city: self.address?.city,
              zipcode: self.address?.zipcode,
              geoLocationLatitude: self.address?.geo?.lat,
              geoLocationLongitude: self.address?.geo?.lng)
    }
}
