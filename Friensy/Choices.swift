//
//  Choices.swift
//  Friensy
//
//  Created by Maya Krishnan on 4/20/26.
//

import SwiftUI

struct Choices: View {
    @State private var number = 0
    @State private var fahrenheit = 0.0
    @State private var gender = "Male"
    @State private var weather = "☀️"
    @State private var outdoors = false
    @State private var indoors = false
    @State private var isDate = false
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Choices")
                        .font(Font.custom("Bodoni 72 Oldstyle", size: 45))
                    HStack {
                        Text("Attendees")
                        Picker("", selection: $number) {
                            Text("1").tag(1)
                            Text("2").tag(2)
                            Text("3").tag(3)
                            Text("4").tag(4)
                            Text("5").tag(5)
                            Text("6").tag(6)
                            Text("7+").tag(7)
                        }
                        .pickerStyle(.segmented)
                        .scaleEffect(1.15)
                        .frame(width: 250, height: 35)
                        .padding()
                    }
                    VStack(spacing: 5) {
                        Text("Who's coming?")
                        Picker("", selection: $gender) {
                            Text("Males").tag("Males")
                            Text("Females").tag("Females")
                            Text("Both").tag("Both")
                        }
                        .pickerStyle(.segmented)
                        .scaleEffect(1.3)
                        .frame(width: 250, height: 40)
                    }
                    VStack(spacing: 5) {
                        Text("Is this a date?")
                        
                        Picker("", selection: $isDate) {
                            Text("No").tag(false)
                            Text("Yes").tag(true)
                        }
                        .pickerStyle(.segmented)
                        .scaleEffect(1.2)
                        .frame(width: 200, height: 35)
                    }
                    .padding(10)
                    
                    Text("Weather")
                    Slider(value: $fahrenheit, in: -30...110)
                    Text("\(fahrenheit, specifier: "%.1f") Fahrenheit")
                    HStack{
                        Picker("", selection: $weather) {
                            Text("☀️").tag("☀️")
                            Text("⛅").tag("⛅")
                            Text("🌧️").tag("🌧️")
                            Text("🌩️").tag("🌩️")
                            Text("❄️").tag("❄️")
                        }
                        .pickerStyle(.segmented)
                        .scaleEffect(1.3)
                        .frame(width: 250, height: 40)
                    }
                    .padding(20)
                    HStack{
                        Text("Indoors")
                            .font((Font.custom("Bodoni 72 Oldstyle", size: 20)))
                            .fontWeight(outdoors ? .regular : .bold)
                            .foregroundColor(outdoors ? .secondary : .primary)
                        Toggle("", isOn: $outdoors)
                            .frame(width: 60)
                        Text("Outdoors")
                            .font((Font.custom("Bodoni 72 Oldstyle", size: 20)))
                            .fontWeight(outdoors ? .bold : .regular)
                            .foregroundColor(outdoors ? .primary : .secondary) // sets mi to bold if in mi
                    }
                    .padding()
                    
                    Spacer()
                    
                    NavigationLink(destination: Results()) {
                        Text("Play")
                            .frame(width: 100)
                            .font(Font.custom("Bodoni 72 Oldstyle", size: 45))
                            .padding()
                            .background(Color(.pink.opacity(0.3)))
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .padding(.top, 20)
                    .simultaneousGesture(TapGesture().onEnded { withAnimation(.none) {} })
                    Spacer()
                }
            }
            .navigationViewStyle(.stack)
            .padding(.bottom, 40)
        }
    }
}
#Preview {
    Choices()
}
