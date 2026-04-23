//
//  Tellmemore.swift
//  Friensy
//
//  Created by Katherine Pizzirusso on 4/22/26.
//

import SwiftUI

struct Tellmemore: View {
    
    @EnvironmentObject var appState: AppStateManager
    
    var body: some View {
        
        VStack(spacing: 25) {
            Text("Tell Me More")
                .font(Font.custom("Bodoni 72 Oldstyle", size: 40))
            
            Text("Select vibes")
                .font(.headline)
            
            // multi select buttons
            HStack(spacing: 12) {
                vibeButton("Fun")
                vibeButton("Chill")
                vibeButton("Active")
                vibeButton("Social")
                vibeButton("Creative")
            }
            
            Spacer()
            
            NavigationLink(destination: Results()) {
                Text("See Results")
                    .frame(width: 180)
                    .padding()
                    .background(Color.pink.opacity(0.3))
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
        }
        .padding()
    }
    
    //button ui
    func vibeButton(_ vibe: String) -> some View {
        Button(action: {
            toggleVibe(vibe)
        }) {
            Text(vibe)
                .padding()
                .background(appState.state.vibes.contains(vibe) ? Color.pink : Color.gray.opacity(0.3))
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
    
    //toggle logic
    func toggleVibe(_ vibe: String) {
        if appState.state.vibes.contains(vibe) {
            appState.state.vibes.remove(vibe)
        } else {
            appState.state.vibes.insert(vibe)
        }
    }
}
#Preview {
    Tellmemore()
        .environmentObject(AppStateManager())
}
