//
//  Choices.swift
//  Friensy
//
//  Created by Maya Krishnan on 4/20/26.
//

import SwiftUI
import MapKit

struct Choices: View {
    @State private var startPosition = MapCameraPosition.userLocation(fallback: .automatic)
    @State private var number = 0
    @State private var fahrenheit = 0.0
    @State private var gender = "Male"
    @State private var weather = "☀️"
    @State private var outdoors = false
    @State private var indoors = false
    @State private var isDate = false
    @State private var locationManager = LocationManager()
    @State private var radius: Double = 5
    
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
                    
                    VStack(spacing: 8) {
                        Text("Location")
                            .font(Font.custom("Bodoni 72 Oldstyle", size: 20))
                        
                        if locationManager.city != "" {
                            
                            Text("\(locationManager.city), \(locationManager.zip)")
                                .font(.headline)
                            
                        } else {
                            Text("Fetching location...")
                                .foregroundColor(.gray)
                        }
                    }
                    
                    VStack(spacing: 8) {
                        Text("Radius")

                        Picker("Radius", selection: $radius) {
                            Text("2 mi").tag(2.0)
                            Text("5 mi").tag(5.0)
                            Text("10 mi").tag(10.0)
                            Text("15 mi").tag(15.0)
                            Text("20 mi").tag(20.0)
                            Text("25+ mi").tag(25.0)
                        }
                        .pickerStyle(.segmented)
                        .scaleEffect(0.9)
                    }
                    .padding()
                    
                    let radiusInMeters = radius * 1609.34
                    Map(position: $startPosition) {
                        UserAnnotation()

                        if let location = locationManager.userLocation {
                            MapCircle(center: location, radius: radius * 1609.34)
                                .foregroundStyle(.pink.opacity(0.1))
                        }
                    }
                    .aspectRatio(1, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color(.pink.opacity(0.4)), lineWidth: 10)
                        )
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    NavigationLink(destination: Results()) {
                        Text("Plan")
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
