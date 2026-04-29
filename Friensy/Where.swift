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
    @State private var weatherManager = WeatherManager()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Where?")
                        .font(Font.custom("Bodoni 72 Oldstyle", size: 45))
                  
                    Text("Weather")
                
                    .padding(20)
                    VStack(spacing: 5) {
                        Text("Location")
                            .font((Font.custom("Bodoni 72 Oldstyle", size: 20)))
                            
                        Picker("", selection: $appState.state.selectedLocation) {
                            Text("Indoor").tag(LocationRequirement.indoor)
                            Text("Outdoor").tag(LocationRequirement.outdoor)
                        }
                        .font((Font.custom("Bodoni 72 Oldstyle", size: 20)))
                        .pickerStyle (.segmented)
                        .frame(width: 260, height: 40)
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
                    
                    Group {
                        if let location = locationManager.userLocation {
                            
                            
                            Map(position: $startPosition) {
                                UserAnnotation()
                                
                                MapCircle(
                                    center: location,
                                    radius: radius * 1609.34
                                )
                                .foregroundStyle(.pink.opacity(0.1))
                            }
                            .onAppear {
                                updateCamera()
                            }
                            .onChange(of: radius) {
                                updateCamera()
                            }
                            .onChange(of: locationManager.userLocation?.latitude) {
                                guard let location = locationManager.userLocation else { return }
                                
                                weatherManager.fetchWeather(
                                    lat: location.latitude,
                                    lon: location.longitude
                                )
                                
                                updateCamera()
                            }
                        } else {
                            ZStack {
                                Color.pink.opacity(0.1)
                                Text("Loading map...")
                                    .foregroundStyle(.secondary)
                            }
                            .frame(height: 300)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
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
    
    func weatherEmoji() -> String {
        switch weatherManager.condition {
        case "Clear": return "☀️"
        case "Clouds": return "⛅"
        case "Rain": return "🌧️"
        case "Thunderstorm": return "🌩️"
        case "Snow": return "❄️"
        default: return "🌤️"
        }
    }
}
#Preview {
    Where()
        .environmentObject(AppStateManager())
}
