//
//  Results.swift
//  Friensy
//
//  Created by Katherine Pizzirusso on 4/21/26.
//

import SwiftUI

struct Results: View {
    
    @EnvironmentObject var appState: AppStateManager
    
    var body: some View {
        
        let ideas = ActivityData.generateIdeas(from: appState.state)
        
        VStack {
            
            Text("Your Ideas")
                .font(Font.custom("Bodoni 72 Oldstyle", size: 35))
            
            if ideas.isEmpty {
                Text("No matches — try different settings")
            } else {
                List(ideas, id: \.name) { activity in
                    VStack(alignment: .leading) {
                        Text(activity.name)
                            .font(Font.custom("Bodoni 72 Oldstyle", size: 25))
                        
                        HStack {
                            Text(activity.energyLevel.emoji)
                            Text(activity.priceLevel.display)
                            
                            if activity.requiresFocus {
                                Text("🧠")
                            }
                        }
                    }
                }
            }
        }
    }
}
