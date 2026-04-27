//
//  ActivityData.swift
//  Friensy
//
//  Created by Katherine Pizzirusso on 4/22/26.
//

import Foundation

enum LocationType {
    case indoor
    case outdoor
    case both
}

//model
struct Activity {
    let name: String
    let minPeople: Int
    let isDate: Bool
    let locationType: LocationType
    let goOut: Bool
    
    let types: Set<String>
    let energyLevel: String
    let priceLevel: String
}

struct ActivityData {
    
    static let allActivities: [Activity] = [
        
        // low energy
        Activity(
            name: "Movie night",
            minPeople: 1,
            isDate: true,
            locationType: .indoor,
            goOut: false,
            types: ["Entertainment", "Food & Drinks", "Chill"],
            energyLevel: "⚡️",
            priceLevel: "$"
        ),
        
        Activity(
            name: "Board games",
            minPeople: 2,
            isDate: true,
            locationType: .indoor,
            goOut: false,
            types: ["Social", "Food & Drinks","Chill"],
            energyLevel: "⚡️",
            priceLevel: "$"
        ),
        
        Activity(
            name: "People watching",
            minPeople: 2,
            isDate: true,
            locationType: .both,
            goOut: false,
            types: ["Spontaneous", "Fun", "Silly"],
            energyLevel: "⚡️",
            priceLevel: "free"
        ),
        
        //medium energy
        Activity(
            name: "Bowling",
            minPeople: 2,
            isDate: true,
            locationType: .indoor,
            goOut: true,
            types: ["Sports & Fitness", "Entertainment"],
            energyLevel: "⚡️⚡️",
            priceLevel: "$$"
        ),
        
        Activity(
            name: "Painting",
            minPeople: 1,
            isDate: true,
            locationType: .both,
            goOut: false,
            types: ["Creativity", "Fun"],
            energyLevel: "⚡️⚡️",
            priceLevel: "$$"
        ),
        
        Activity(
            name: "Escape room",
            minPeople: 2,
            isDate: true,
            locationType: .indoor,
            goOut: true,
            types: ["Experiences", "Focus needed"],
            energyLevel: "⚡️⚡️",
            priceLevel: "$$"
        ),
        
        Activity(
            name: "Mini golf",
            minPeople: 2,
            isDate: true,
            locationType: .outdoor,
            goOut: true,
            types: ["Sports & Fitness", "Entertainment"],
            energyLevel: "⚡️⚡️",
            priceLevel: "$$"
        ),
        
        //high energy
        Activity(
            name: "Hiking",
            minPeople: 1,
            isDate: true,
            locationType: .outdoor,
            goOut: true,
            types: ["Sports & Fitness", "Experiences"],
            energyLevel: "⚡️",
            priceLevel: "free"
        )
    ]
    
    static func generateIdeas(from state: AppState) -> [String] {
        
        var results: [(String, Int)] = []
        
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
            if activity.locationType != .both &&
                activity.locationType != state.selectedLocation {
                continue
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
                score -= 1
            }

            
            results.append((activity.name, score))
        }
        
        return results.map { $0.0 }
    }
}
