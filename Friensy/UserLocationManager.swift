//
//  UserLocation.swift
//  Friensy
//
//  Created by Maya Krishnan on 4/21/26.
//

import Foundation
import CoreLocation

@Observable
class LocationManager: NSObject, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    var userLocation: CLLocationCoordinate2D?
    var geocoder = CLGeocoder()
    var city = ""
    var zip = ""

    
    override init() {
        super.init ()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    // capture's user's coordinates:
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            userLocation = location.coordinate
            geocoder.reverseGeocodeLocation(location) { placemarks, error in
                if let placemark = placemarks?.first {
                    self.city = placemark.locality ?? "Unknown City"
                    self.zip = placemark.postalCode ?? "Unknown ZIP"
                }
            }
        }
    }
}
