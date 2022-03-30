//
//  String+Extension.swift
//  GoodWeather
//
//  Created by 오국원 on 2022/03/30.
//

import Foundation

extension String {
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
