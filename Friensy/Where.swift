//
//  Where.swift
//  Friensy
//
//  Created by Maya Krishnan on 4/21/26.
//

import SwiftUI
import MapKit

struct Where: View {
    @EnvironmentObject var appState: AppStateManager
    @State private var startPosition = MapCameraPosition.automatic
    @State private var locationManager = LocationManager()
    @State private var radius: Double = 5
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Where?")
                        .font(Font.custom("Bodoni 72 Oldstyle", size: 45))
                  
                    Text("Weather")
                    HStack{
                        Picker("", selection: $appState.state.weather) {
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
                            .fontWeight(appState.state.isOutdoors ? .regular : .bold)
                            .foregroundColor(appState.state.isOutdoors ? .secondary : .primary)
                        Toggle("", isOn: $appState.state.isOutdoors)
                            .frame(width: 60)
                        Text("Outdoors")
                            .font((Font.custom("Bodoni 72 Oldstyle", size: 20)))
                            .fontWeight(appState.state.isOutdoors ? .bold : .regular)
                            .foregroundColor(appState.state.isOutdoors ? .primary : .secondary) // sets mi to bold if in mi
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
                    .onChange(of: radius) {
                        updateCamera()
                    }
                    .onAppear {
                        updateCamera()
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    NavigationLink(destination: Tellmemore()) {
                        Text("Next")
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
    
    func updateCamera() {
        if let location = locationManager.userLocation {
            
            let distance = radius * 1609.34  // miles → meters
            
            startPosition = .region(
                MKCoordinateRegion(
                    center: location,
                    span: MKCoordinateSpan(
                        latitudeDelta: distance / 111000,
                        longitudeDelta: distance / 111000
                    )
                )
            )
        }
    }
}
#Preview {
    Where()
}
