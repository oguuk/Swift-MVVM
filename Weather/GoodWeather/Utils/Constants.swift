//
//  Constants.swift
//  GoodWeather
//
//  Created by 오국원 on 2022/03/30.
//

import Foundation

struct Constants {
    struct Urls {
        
        static func urlForWeatherByCity(city: String) -> URL {
            let userDefaults = UserDefaults.standard
            let unit = (userDefaults.value(forKey: "unit") as? String) ?? "imperial"
            return URL(string:
                        "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=6ffdb2854052fbdd1a8df4e1c5919a19&units=\(unit)")!
        }
    }
}
