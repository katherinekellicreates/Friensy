//
//  ActivityDetailView.swift
//  Friensy
//
//  Created by Maya Krishnan on 4/29/26.
//

import SwiftUI
import MapKit

struct ActivityDetailView: View {
    let activity: Activity
    
    @State private var startPosition = MapCameraPosition.automatic
    @State private var mapRegion = MKCoordinateRegion()
    @State private var locationManager = LocationManager()
    @State private var places: [Place] = []
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text(activity.name)
                .font(Font.custom("Bodoni 72 Oldstyle", size: 35))
            
            HStack {
                Text(activity.energyLevel.emoji)
                Text(activity.priceLevel.display)
            }
            
            Map(position: $startPosition) {
                UserAnnotation()
                
                ForEach(places) { place in
                    Annotation(
                        place.mapItem.name ?? "",
                        coordinate: place.mapItem.placemark.coordinate
                    ) {
                        Text("⭐️")
                    }
                }
            }
            .onMapCameraChange { context in
                mapRegion = context.region
                performSearch()
            }
            .aspectRatio(1, contentMode: .fit)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color(.pink.opacity(0.4)), lineWidth: 6)
            )
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            
            Spacer()
        }
        .onAppear {
            startPosition = .userLocation(fallback: .automatic)
        }
    }
    
    func performSearch() {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchQueryForActivity()
        request.region = mapRegion
        
        let search = MKLocalSearch(request: request)
        
        search.start { response, _ in
            if let response = response {
                places = response.mapItems.map { Place(mapItem: $0) }
            }
        }
    }
    
    func searchQueryForActivity() -> String {
        switch activity.name {
        case "Escape room":
            return "escape room"
        case "Bowling":
            return "bowling alley"
        case "Arcade":
            return "arcade"
        case "Mini golf":
            return "mini golf"
        case "Amusement Park":
            return "amusement park"
        case "Hiking":
            return "hiking trail"
        default:
            return activity.name
        }
    }
}

struct Place: Identifiable {
    let id = UUID()
    let mapItem: MKMapItem
}

#Preview {
    ActivityDetailView(
               activity: Activity(
                   name: "Escape room",
                   minPeople: 2,
                   isDate: true,
                   locationRequirement: .indoor,
                   goOut: true,
                   types: ["Experiences"],
                   energyLevel: .medium,
                   priceLevel: .medium,
                   requiresFocus: true
               )
           )
}
