//
//  WeatherManager.swift
//  Friensy
//
//  Created by Maya Krishnan on 4/29/26.
//

import Foundation
import CoreLocation

struct WeatherData: Decodable {
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let main: String
}

@Observable
class WeatherManager {
    var temperature: Double = 0
    var condition: String = ""
    
    func fetchWeather(lat: Double, lon: Double) {
        let apiKey = "1e5ec02fdf50bc0a2defdb8c6fe7a005"
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&units=imperial&appid=\(apiKey)"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            
            if let decoded = try? JSONDecoder().decode(WeatherData.self, from: data) {
                DispatchQueue.main.async {
                    self.temperature = decoded.main.temp
                    self.condition = decoded.weather.first?.main ?? ""
                }
            }
        }.resume()
    }
}
