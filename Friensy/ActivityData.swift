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
    let isGroup: Bool
    let isDate: Bool
    let isOutdoor: Bool
}

struct ActivityData {
    
    static let allActivities: [Activity] = [
        Activity(name: "Movie night", isGroup: true, isDate: true, isOutdoor: false),
        Activity(name: "Bowling", isGroup: true, isDate: true, isOutdoor: false),
        Activity(name: "Escape room", isGroup: true, isDate: true, isOutdoor: false),
        Activity(name: "Board games", isGroup: true, isDate: true, isOutdoor: false),
        Activity(name: "Hiking", isGroup: true, isDate: true, isOutdoor: true),
        Activity(name: "Mini golf", isGroup: true, isDate: true, isOutdoor: true),
    ]
    
    static func generateIdeas(from state: AppState) -> [String] {
        
        var results: [(String, Int)] = []
        
        for activity in allActivities {
            
            var score = 0
            
            // -------------------
            // STAY IN MODE
            // -------------------
            if !state.goOut {
                if !activity.isOutdoor {
                    score += 3
                }
            }
            
            // -------------------
            // GO OUT MODE
            // -------------------
            if state.goOut {
                if state.isOutdoors == activity.isOutdoor {
                    score += 2
                }
            }
            
            // -------------------
            // DATE
            // -------------------
            if state.isDate && activity.isDate {
                score += 2
            }
            
            // -------------------
            // GROUP SIZE
            // -------------------
            if state.number >= 3 && activity.isGroup {
                score += 2
            }
            
            if state.number == 2 && activity.isDate {
                score += 2
            }
            
            // -------------------
            // VIBES
            // -------------------
            if state.vibes.contains("Fun") {
                if activity.isGroup || activity.isOutdoor {
                    score += 2
                }
            }
            
            if state.vibes.contains("Chill") {
                if !activity.isOutdoor {
                    score += 2
                }
            }
            
            if state.vibes.contains("Active") {
                if activity.isOutdoor {
                    score += 2
                }
            }
            
            if state.vibes.contains("Social") {
                if activity.isGroup {
                    score += 2
                }
            }
            
            // -------------------
            // SAVE RESULT
            // -------------------
            if score > 0 {
                results.append((activity.name, score))
            }
        }
        
        return results
            .sorted { $0.1 > $1.1 }
            .map { $0.0 }
    }
}
