//
//  ViewController.swift
//  mapsApp
//
//  Created by Mahmoud on 1/26/22.
//

import UIKit
import GoogleMaps
import CoreLocation
class ViewController: UIViewController, CLLocationManagerDelegate {

    let coreManager = CLLocationManager()
    @IBOutlet weak var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coreManager.delegate = self
        coreManager.requestWhenInUseAuthorization()  // to request authorization
        coreManager.startUpdatingLocation()     // to start update the location
        
//        print("License: \n\n\(GMSServices.openSourceLicenseInfo())") important to add this to your textView       "the license of google"
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        let coordinate = location.coordinate
        
        
        let camera = GMSCameraPosition.camera(withLatitude: coordinate.latitude, longitude: coordinate.longitude, zoom: 10.0)
        mapView.camera = camera
        
        let marker = GMSMarker()       //Pin icon
        marker.position = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        marker.title = ""
        marker.snippet = ""
        marker.map = mapView
    }
}
