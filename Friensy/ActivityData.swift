//
//  ActivityData.swift
//  Friensy
//
//  Created by Katherine Pizzirusso on 4/22/26.
//

import Foundation

//model
struct Activity {
    let name: String
    let minPeople: Int
    let isDate: Bool
    let isOutdoor: Bool
    
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
            isOutdoor: false,
            types: ["Entertainment", "Food & Drinks", "Chill"],
            energyLevel: "low",
            priceLevel: "low"
        ),
        
        Activity(
            name: "Board games",
            minPeople: 2,
            isDate: true,
            isOutdoor: false,
            types: ["Social", "Food & Drinks","Chill"],
            energyLevel: "low",
            priceLevel: "low"
        ),
        
        Activity(
            name: "People watching",
            minPeople: 2,
            isDate: true,
            isOutdoor: false,
            types: ["Spontaneous", "Fun", "Silly"],
            energyLevel: "low",
            priceLevel: "free"
        ),
        
        //medium energy
        Activity(
            name: "Bowling",
            minPeople: 2,
            isDate: true,
            isOutdoor: false,
            types: ["Sports & Fitness", "Entertainment"],
            energyLevel: "medium",
            priceLevel: "medium"
        ),
        
        Activity(
            name: "Painting",
            minPeople: 1,
            isDate: true,
            isOutdoor: false,
            types: ["Creativity", "Fun"],
            energyLevel: "medium",
            priceLevel: "medium"
        ),
        
        Activity(
            name: "Escape room",
            minPeople: 2,
            isDate: true,
            isOutdoor: false,
            types: ["Experiences", "Focus needed"],
            energyLevel: "medium",
            priceLevel: "medium"
        ),
        
        Activity(
            name: "Mini golf",
            minPeople: 2,
            isDate: true,
            isOutdoor: true,
            types: ["Sports & Fitness", "Entertainment"],
            energyLevel: "medium",
            priceLevel: "medium"
        ),
        
        //high energy
        Activity(
            name: "Hiking",
            minPeople: 1,
            isDate: true,
            isOutdoor: true,
            types: ["Sports & Fitness", "Experiences"],
            energyLevel: "high",
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
            if !state.goOut && activity.isOutdoor {
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
