//
//  UsersListEntityTests.swift
//  conexaChallengeTests
//
//  Created by Mario Angelillo on 26/12/2023.
//

import Foundation
import XCTest
@testable import conexaChallenge

class UsersListEntityTests: XCTestCase {
    
    var userEntityWithNilValues: UserEntity!
    var userEntityWithNotNilValues: UserEntity!
    
    override func setUp() {
        userEntityWithNilValues = UserEntity(id: nil, firstname: nil, lastname: nil, street: nil, city: nil, zipcode: nil, geoLocationLatitude: nil, geoLocationLongitude: nil)
        
        userEntityWithNotNilValues = UserEntity(id: 2, firstname: "Mario", lastname: "Angelillo", street: "Av Mitre", city: "Tucumán", zipcode: "4000", geoLocationLatitude: "-42.0123", geoLocationLongitude: "71.1421")
    }
    
    func testWhenSetUserWithNilValues() {
        XCTAssertNotNil(userEntityWithNilValues.id)
        XCTAssertNotNil(userEntityWithNilValues.firstname)
        XCTAssertNotNil(userEntityWithNilValues.lastname)
        XCTAssertNotNil(userEntityWithNilValues.street)
        XCTAssertNotNil(userEntityWithNilValues.city)
        XCTAssertNotNil(userEntityWithNilValues.zipcode)
        XCTAssertNotNil(userEntityWithNilValues.geoLocationLatitude)
        XCTAssertNotNil(userEntityWithNilValues.geoLocationLongitude)
    }
    
    func testDefaultValuesWhenSetUserWithNilValues() {
        XCTAssertEqual(userEntityWithNilValues.id, 0)
        XCTAssertEqual(userEntityWithNilValues.firstname, "")
        XCTAssertEqual(userEntityWithNilValues.lastname, "")
        XCTAssertEqual(userEntityWithNilValues.street, "Calle no especificada")
        XCTAssertEqual(userEntityWithNilValues.city, "Ciudad no especificada")
        XCTAssertEqual(userEntityWithNilValues.zipcode, "Código postal no especificado")
        XCTAssertEqual(userEntityWithNilValues.geoLocationLatitude, "0.0")
        XCTAssertEqual(userEntityWithNilValues.geoLocationLongitude, "0.0")
    }
    
    func testWhenSetUserWithNotNilValues() {
        XCTAssertNotNil(userEntityWithNotNilValues.id)
        XCTAssertNotNil(userEntityWithNotNilValues.firstname)
        XCTAssertNotNil(userEntityWithNotNilValues.lastname)
        XCTAssertNotNil(userEntityWithNotNilValues.street)
        XCTAssertNotNil(userEntityWithNotNilValues.city)
        XCTAssertNotNil(userEntityWithNotNilValues.zipcode)
        XCTAssertNotNil(userEntityWithNotNilValues.geoLocationLatitude)
        XCTAssertNotNil(userEntityWithNotNilValues.geoLocationLongitude)
    }
    
    func testValuesWhenSetUserWithNotNilValues() {
        XCTAssertEqual(userEntityWithNotNilValues.id, 2)
        XCTAssertEqual(userEntityWithNotNilValues.firstname, "Mario")
        XCTAssertEqual(userEntityWithNotNilValues.lastname, "Angelillo")
        XCTAssertEqual(userEntityWithNotNilValues.street, "Av Mitre")
        XCTAssertEqual(userEntityWithNotNilValues.city, "Tucumán")
        XCTAssertEqual(userEntityWithNotNilValues.zipcode, "4000")
        XCTAssertEqual(userEntityWithNotNilValues.geoLocationLatitude, "-42.0123")
        XCTAssertEqual(userEntityWithNotNilValues.geoLocationLongitude, "71.1421")
    }
    
    func testGetCompleteAddress() {
        let completeAddress = userEntityWithNotNilValues.getCompleteAddress()
        let expectedValue = "Av Mitre, Tucumán - 4000"
        XCTAssertEqual(completeAddress, "Av Mitre, Tucumán - 4000")
    }
    
    func testGetFullName() {
        let fullName = userEntityWithNotNilValues.getFullName()
        let expectedValue = "Mario Angelillo"
        XCTAssertEqual(fullName, expectedValue)
    }
    
    func testGetGeolocation() {
        let geolocation = userEntityWithNotNilValues.getGeolocation()
        let expectedValue = UserLocationEntity(latitude: -42.0123, longitude: 71.1421)
        XCTAssertEqual(geolocation.latitude, expectedValue.latitude)
        XCTAssertEqual(geolocation.longitude, expectedValue.longitude)
    }
    
    override func tearDown() {
        userEntityWithNilValues = nil
        userEntityWithNotNilValues = nil
    }
}
