//
//  weatherResponse.swift
//  GoodWeather
//
//  Created by 오국원 on 2022/03/30.
//

import Foundation

struct weatherResponse: Decodable {
    let name: String
    let main: weather
}

struct weather: Decodable {
    let temp: Double
    let humidity: Double
}
