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
                    let location = try! await geocodingClient.coordinateByCity("Denver")
                    print(location)
                }
            }
        }
        .padding()
    }
}

#Preview {
    WeatherView()
}
