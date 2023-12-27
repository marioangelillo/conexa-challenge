//
//  UsersListEntity.swift
//  conexaChallenge
//
//  Created by Mario Angelillo on 22/12/2023.
//

struct UserEntity {
    let id: Int
    let firstname: String
    let lastname: String
    let street: String
    let city: String
    let zipcode: String
    let geoLocationLatitude: String
    let geoLocationLongitude: String
    
    init(id: Int?,
         firstname: String?,
         lastname: String?,
         street: String?,
         city: String?,
         zipcode: String?,
         geoLocationLatitude: String?,
         geoLocationLongitude: String?
    ) {
        self.id = id ?? 0
        self.firstname = firstname ?? ""
        self.lastname = lastname ?? ""
        self.street = street ?? "Calle no especificada"
        self.city = city ?? "Ciudad no especificada"
        self.zipcode = zipcode ?? "Código postal no especificado"
        self.geoLocationLatitude = geoLocationLatitude ?? "0.0"
        self.geoLocationLongitude = geoLocationLongitude ?? "0.0"
    }
    
    func getCompleteAddress() -> String {
        let completeAddress = street + ", " + city + " - " + zipcode
        return completeAddress
    }
    
    func getFullName() -> String {
        firstname + " " + lastname
    }
    
    func getGeolocation() -> UserLocationEntity {
        .init(latitude: Double(self.geoLocationLatitude)!, longitude: Double(self.geoLocationLongitude)!)
    }
}

