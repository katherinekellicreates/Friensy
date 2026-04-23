//
//  UserLocation.swift
//  Friensy
//
//  Created by Maya Krishnan on 4/21/26.
//

import Foundation
import CoreLocation
import MapKit

@Observable
class LocationManager: NSObject, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    var userLocation: CLLocationCoordinate2D?
    
    var city = ""
    var zip = ""
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        // ✅ PREVIEW SAFE GUARD
        if !ProcessInfo.processInfo.environment.keys.contains("XCODE_RUNNING_FOR_PREVIEWS") {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        userLocation = location.coordinate
        
        // ❌ don't run geocoder in preview
        guard !ProcessInfo.processInfo.environment.keys.contains("XCODE_RUNNING_FOR_PREVIEWS") else {
            return
        }
        
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, _ in
            if let placemark = placemarks?.first {
                DispatchQueue.main.async {
                    self.city = placemark.locality ?? "Unknown City"
                    self.zip = placemark.postalCode ?? "Unknown ZIP"
                }
            }
        }
    }
}
