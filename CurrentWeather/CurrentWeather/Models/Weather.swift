//
//  Weather.swift
//  CurrentWeather
//
//  Created by Cause  I'm Electric on 2/28/24.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double
    let feelsLike: Double
    let humidity: Double
    
    private enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case humidity
    }
}
