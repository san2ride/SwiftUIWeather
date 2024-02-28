//
//  WeatherView.swift
//  CurrentWeather
//
//  Created by Cause  I'm Electric on 2/28/24.
//

import SwiftUI

struct WeatherView: View {
    
    var body: some View {
        VStack {
            Button("Get Coordinates") {
                Task {
                    let geocodingClient = GeocodingClient()
                    let weatherClient = WeatherClient()
                    let location = try! await geocodingClient.coordinateByCity("Denver")
                    let weather = try! await weatherClient.fetchWeather(location: location!)
                    print(weather)
                }
            }
        }
        .padding()
    }
}

#Preview {
    WeatherView()
}
