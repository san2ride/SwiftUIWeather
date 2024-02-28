//
//  APIEndpoint.swift
//  CurrentWeather
//
//  Created by Cause  I'm Electric on 2/28/24.
//

import Foundation

enum APIEndpoint {
    
    static let baseURL = "https://api.openweathermap.org"
    
    case coordinatesByLocationName(String)
    case weatherByLatLon(Double, Double)
    
    private var path: String {
        switch self {
                
        }
    }
}
