//
//  AppState.swift
//  Friensy
//
//  Created by Katherine Pizzirusso on 4/22/26.
//

import Foundation

struct AppState {
   
    //who is coming
    var number: Int = 1
    var gender: String = "Both"
    var isDate: Bool = false
    
    //plan type
    var goOut: Bool = true
    var selectedLocation: LocationRequirement = .indoor
    
    //weather
    var weather: String = "☀️"
    
    //tell me more
    var energyLevel: String = "⚡️"
    var priceRange: String = "$"
    var selectedTypes: Set<String> = []
}
