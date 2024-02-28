//
//  WeatherView.swift
//  CurrentWeather
//
//  Created by Cause  I'm Electric on 2/28/24.
//

import SwiftUI

struct WeatherView: View {
    
    @State private var city: String = ""
    @State private var isFetchingWeather: Bool = false
    
    let geocodingClient = GeocodingClient()
    let weatherClient = WeatherClient()
    
    @State private var weather: Weather?
    
    func fetchWeather() async {
        do {
            guard let location = try await geocodingClient.coordinateByCity(city) else { return }
            weather = try await weatherClient.fetchWeather(location: location)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
        VStack {
            TextField("City", text: $city)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    isFetchingWeather = true
                }.task(id: isFetchingWeather) {
                    if isFetchingWeather {
                        await fetchWeather()
                        isFetchingWeather = false
                        city = ""
                    }
                }
            if let weather {
                Text(MeasurementFormatter.temperature(value: weather.temp))
                    .font(.headline)
                    .padding()
                Text(MeasurementFormatter.temperature(value: weather.feelsLike))
                    .font(.subheadline)
                    .padding()
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    WeatherView()
}
