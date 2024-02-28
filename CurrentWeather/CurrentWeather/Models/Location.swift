//
//  Location.swift
//  CurrentWeather
//
//  Created by Cause  I'm Electric on 2/28/24.
//

import Foundation

struct Location: Decodable {
    let name: String
    let state: String
    let lat: Double
    let lon: Double
}
