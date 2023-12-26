//
//  UserDetailsViewController.swift
//  conexaChallenge
//
//  Created by Mario Angelillo on 22/12/2023.
//

import UIKit
import MapKit

class UserLocationViewController: UIViewController, UserLocationViewControllerProtocol {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var presenter: UserLocationPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setLocationOnMap()
    }

    func setLocationOnMap() {
        guard let presenter else { return }
        let coordinates = presenter.getLocation()
        
        let location = CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
        let regionRadius: CLLocationDistance = 500
        let coordinateRegion = MKCoordinateRegion(center: location, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        
        mapView.setRegion(coordinateRegion, animated: true)
        mapView.addAnnotation(annotation)
    }
}
