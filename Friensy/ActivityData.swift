//
//  ActivityData.swift
//  Friensy
//
//  Created by Katherine Pizzirusso on 4/22/26.
//

import Foundation

enum LocationRequirement {
    case indoor
    case outdoor
    case flexible
}

enum EnergyLevel {
    case lowest
    case low
    case medium
    case high
}

enum PriceLevel {
    case free
    case low
    case medium
    case high
}

//model
struct Activity {
    let name: String
    let minPeople: Int
    let isDate: Bool
    let locationRequirement: LocationRequirement
    let goOut: Bool
    
    let types: Set<String>
    let energyLevel: EnergyLevel
    let priceLevel: PriceLevel
    let requiresFocus: Bool
}

struct ActivityData {
    
    static let allActivities: [Activity] = [
        
        //////////////////////////////////////////////////////////////////////////
        ////////////////////////////////!STAY IN!/////////////////////////////////
        //////////////////////////////////////////////////////////////////////////
        
        Activity(
            name: "Movie night",
            minPeople: 1,
            isDate: true,
            locationRequirement: .indoor,
            goOut: false,
            types: ["Entertainment", "Food & Drinks", "Chill"],
            energyLevel: .lowest,
            priceLevel: .free,
            requiresFocus: false
        ),
        
        Activity(
            name: "Board games",
            minPeople: 2,
            isDate: true,
            locationRequirement: .indoor,
            goOut: false,
            types: ["Social", "Food & Drinks","Chill"],
            energyLevel: .low,
            priceLevel: .free,
            requiresFocus: false
        ),
        
        Activity(
            name: "Puzzles",
            minPeople: 1,
            isDate: true,
            locationRequirement: .indoor,
            goOut: false,
            types: ["Social", "Food & Drinks","Chill"],
            energyLevel: .low,
            priceLevel: .free,
            requiresFocus: true
        ),
        
        Activity(
            name: "Minecraft",
            minPeople: 1,
            isDate: true,
            locationRequirement: .indoor,
            goOut: false,
            types: ["Gaming","Entertainment","Fun","Social"],
            energyLevel: .lowest,
            priceLevel: .free,
            requiresFocus: false
        ),
        
        Activity(
            name: "Roblox",
            minPeople: 1,
            isDate: true,
            locationRequirement: .indoor,
            goOut: false,
            types: ["Gaming","Entertainment","Fun","Social"],
            energyLevel: .lowest,
            priceLevel: .free,
            requiresFocus: false
        ),
        
        Activity(
            name: "Call of Duty",
            minPeople: 1,
            isDate: true,
            locationRequirement: .indoor,
            goOut: false,
            types: ["Gaming","Entertainment","Fun","Social"],
            energyLevel: .low,
            priceLevel: .low,
            requiresFocus: false
        ),
        
        Activity(
            name: "Bake Something",
            minPeople: 1,
            isDate: true,
            locationRequirement: .indoor,
            goOut: false,
            types: ["Creativity","Food & Drinks","Fun","Social"],
            energyLevel: .low,
            priceLevel: .low,
            requiresFocus: false
            
            ),
        //////////////////////////////////////////////////////////////////////////
        
        
        //////////////////////////////////////////////////////////////////////////
        /////////////////////////////////!OUTDOOR!////////////////////////////////
        //////////////////////////////////////////////////////////////////////////
        
        Activity(
            name: "Hiking",
            minPeople: 1,
            isDate: true,
            locationRequirement: .outdoor,
            goOut: true,
            types: ["Sports & Fitness", "Experiences"],
            energyLevel: .high,
            priceLevel: .free,
            requiresFocus: false
        ),
        
        Activity(
            name: "Mini golf",
            minPeople: 2,
            isDate: true,
            locationRequirement: .outdoor,
            goOut: true,
            types: ["Sports & Fitness", "Entertainment"],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: false
        ),
        
        Activity(
            name: "Amusement Park",
            minPeople: 2,
            isDate: true,
            locationRequirement: .outdoor,
            goOut: true,
            types: ["Social", "Experiences","Fun","Food & Drinks"],
            energyLevel: .high,
            priceLevel: .high,
            requiresFocus: false
        ),
        
        Activity(
            name: "Rollar Skating",
            minPeople: 2,
            isDate: true,
            locationRequirement: .outdoor,
            goOut: true,
            types: ["Social", "Sports & Fitness"],
            energyLevel: .high,
            priceLevel: .high,
            requiresFocus: false
        ),
        
        Activity(
            name: "Ice Skating",
            minPeople: 2,
            isDate: true,
            locationRequirement: .outdoor,
            goOut: true,
            types: ["Social", "Sports & Fitness"],
            energyLevel: .high,
            priceLevel: .medium,
            requiresFocus: false
        ),
        
        Activity(
            name: "Beach Day",
            minPeople: 2,
            isDate: true,
            locationRequirement: .outdoor,
            goOut: true,
            types: ["Social","Fun","Food & Drinks"],
            energyLevel: .medium,
            priceLevel: .free,
            requiresFocus: false
        ),
        
        Activity(
            name: "Thrift Shopping",
            minPeople: 2,
            isDate: true,
            locationRequirement: .outdoor,
            goOut: true,
            types: ["Social", "Shopping","Fun"],
            energyLevel: .high,
            priceLevel: .medium,
            requiresFocus: false
        ),
        
        Activity(
            name: "Bookstore Shopping",
            minPeople: 1,
            isDate: true,
            locationRequirement: .outdoor,
            goOut: true,
            types: ["Study/Productive", "Entertainment"],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: false
        ),
        //////////////////////////////////////////////////////////////////////////
        
       
        //////////////////////////////////////////////////////////////////////////
        ////////////////////////////////!FLEXIBLE!////////////////////////////////
        //////////////////////////////////////////////////////////////////////////
        
        Activity(
            name: "People watching",
            minPeople: 2,
            isDate: true,
            locationRequirement: .flexible,
            goOut: true,
            types: ["Spontaneous", "Fun", "Silly"],
            energyLevel: .low,
            priceLevel: .free,
            requiresFocus: false
        ),
        
        Activity(
            name: "Painting",
            minPeople: 1,
            isDate: true,
            locationRequirement: .flexible,
            goOut: false,
            types: ["Creativity", "Fun"],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: false
        ),
        
        //////////////////////////////////////////////////////////////////////////
        
        
        //////////////////////////////////////////////////////////////////////////
        /////////////////////////////!GO OUT - INDOOR!////////////////////////////
        //////////////////////////////////////////////////////////////////////////
        
        Activity(
            name: "Bowling",
            minPeople: 2,
            isDate: true,
            locationRequirement: .indoor,
            goOut: true,
            types: ["Sports & Fitness", "Entertainment"],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: false
        ),
        
        Activity(
            name: "Arcade",
            minPeople: 2,
            isDate: true,
            locationRequirement: .indoor,
            goOut: true,
            types: ["Entertainment", "Fun","Food & Drinks"],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: false
        ),
        
        Activity(
            name: "Escape room",
            minPeople: 2,
            isDate: true,
            locationRequirement: .indoor,
            goOut: true,
            types: ["Experiences"],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: true
        ),
        Activity(
            name: "Laser tag",
            minPeople: 2,
            isDate: true,
            locationRequirement: .indoor,
            goOut: true,
            types: ["Experiences","Fun"],
            energyLevel: .high,
            priceLevel: .medium,
            requiresFocus: false
        )
    ]
    
    //////////////////////////////////////////////////////////////////////////////
    
    static func generateIdeas(from state: AppState) -> [Activity] {
        
        var results: [(Activity, Int)] = []
        
        for activity in allActivities {
            
            var score = 0
            
            
            // group size
            if state.number < activity.minPeople {
                continue
            }
            
            // date
            if state.isDate && !activity.isDate {
                continue
            }
            
            // stay in vs go out
            if activity.goOut != state.goOut {
                continue
            }

            if state.goOut {
                if activity.locationRequirement != state.selectedLocation &&
                    activity.locationRequirement != .flexible {
                    continue
                }
            }
            var typeMatch = false

            for type in state.selectedTypes {
                if activity.types.contains(type) {
                    score += 3
                    typeMatch = true
                }
            }

            // small penalty if user selected types but this doesn't match
            if !state.selectedTypes.isEmpty && !typeMatch {
                score -= 0 //1 once have more activites
            }

            
            results.append((activity, score))
        }
        
        return results
            .sorted { $0.1 > $1.1 }
            .map { $0.0 }
    }
}

extension EnergyLevel {
    var emoji: String {
        switch self {
        case .lowest: return "⚡️"
        case .low: return "⚡️⚡️"
        case .medium: return "⚡️⚡️⚡️"
        case .high: return "⚡️⚡️⚡️⚡️"
        }
    }
}
extension PriceLevel {
    var display: String {
        switch self {
        case .free: return "Free"
        case .low: return "$"
        case .medium: return "$$"
        case .high: return "$$$"
        }
    }
}
