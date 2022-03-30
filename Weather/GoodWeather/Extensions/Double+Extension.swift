//
//  Double+Extension.swift
//  GoodWeather
//
//  Created by 오국원 on 2022/03/30.
//

import Foundation


extension Double {
    
    func formatAsDegree() ->  String {
        return String(format:"%.0f°",self)
    }
}
