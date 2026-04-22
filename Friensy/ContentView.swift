//
//  ContentView.swift
//  Friensy
//
//  Created by Katherine Pizzirusso on 4/17/26.
//  Gabby did this

import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Pink").ignoresSafeArea(.all)
                VStack {
                    Text("Friensy")
                        .font(Font.custom("Bodoni 72 Oldstyle", size: 45))
<<<<<<< HEAD
                    NavigationLink(destination: WhosComing()) {
                        NavigationLink("Plan", destination: WhosComing())
=======
                    NavigationLink(destination: Choices()) {
                        NavigationLink("Play", destination: Choices())
>>>>>>> main
                            .frame(width: 100)
                            .font(Font.custom("Bodoni 72 Oldstyle", size: 45))
                            .padding()
                            .background(Color(.pink.opacity(0.3)))
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .simultaneousGesture(TapGesture().onEnded { withAnimation(.none) {} })
                    Spacer()
                }
                .padding()
            }
            .navigationViewStyle(.stack)
        }
    }

#Preview {
    ContentView()
}
