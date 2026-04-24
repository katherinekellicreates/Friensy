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
            
            Text("Activity Type")
                .font(.headline)

            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: 110))
            ], spacing: 10) {
                
                ForEach(ActivityTypes.all, id: \.self) { type in
                    typeChip(type)
                }
            }
            
            Text("Energy Level")
                .font(.headline)

            Picker("", selection: $appState.state.energyLevel) {
                Text("Low").tag("low")
                Text("Medium").tag("medium")
                Text("High").tag("high")
            }
            .pickerStyle(.segmented)
            
            Text("Price")
                .font(.headline)

            Picker("", selection: $appState.state.priceRange) {
                Text("$").tag("low")
                Text("$$").tag("medium")
                Text("$$$").tag("high")
            }
            .pickerStyle(.segmented)
            
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
    
    func typeChip(_ type: String) -> some View {
        Button(action: {
            toggleType(type)
        }) {
            Text(type)
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .background(
                    appState.state.selectedTypes.contains(type)
                    ? Color.pink
                    : Color.gray.opacity(0.3)
                )
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
    
    func toggleType(_ type: String) {
        if appState.state.selectedTypes.contains(type) {
            appState.state.selectedTypes.remove(type)
        } else {
            appState.state.selectedTypes.insert(type)
        }
    }
}
#Preview {
    Tellmemore()
        .environmentObject(AppStateManager())
}
