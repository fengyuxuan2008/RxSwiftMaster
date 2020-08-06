//
//  WeatherData.swift
//  Sky
//
//  Created by apple on 2020/8/6.
//  Copyright © 2020 Mars. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let latitude: Double
    let longitude: Double
    let currently: CurrentWeather
    
    struct CurrentWeather: Codable {
        let time: Date
        let summary: String
        let icon: String
        let temperature: Double
        let humidity: Double
    }
}
