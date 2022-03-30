//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by 오국원 on 2022/03/30.
//

import UIKit

protocol AddWeatherDelegate{
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController{
    @IBOutlet weak var cityNameTextField: UITextField!
    private var addWeatherVM = AddWeatherViewModel()
    var delegate: AddWeatherDelegate?
    @IBAction func saveCityButtonPressed() {
        if let city = cityNameTextField.text {
            addWeatherVM.addWeather(for: city) { (vm) in
                self.delegate?.addWeatherDidSave(vm: vm)
                self.dismiss(animated: true, completion: nil)
            }
            
        }
    }
}
