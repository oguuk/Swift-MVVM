//
//  AddWeatherViewModel.swift
//  GoodWeather
//
//  Created by 오국원 on 2022/03/30.
//

import UIKit

class AddWeatherViewModel {
    func addWeather(for city: String,completion: @escaping (WeatherViewModel) -> Void) {
        
        let weatherURL = Constants.Urls.urlForWeatherByCity(city: city)
        
        let weatherResource = Resource<weatherResponse>(url: weatherURL) { data in
            let weatherResponse = try? JSONDecoder().decode(weatherResponse.self, from: data)
            return weatherResponse
            
        }
        
        Webservice().load(resource: weatherResource) { (result) in
            if let weatherResource = result {
                let vm  = WeatherViewModel(weather: weatherResource)
                completion(vm)
            }
        }
    }
}
