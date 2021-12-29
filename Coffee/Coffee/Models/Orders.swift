//
//  Orders.swift
//  Coffee
//
//  Created by 오국원 on 2021/12/29.
//

import Foundation

enum Coffeename: String, Codable{
    case cappuccino
    case latte
    case espressino
    case cortado
}

enum CoffeeSize: String, Codable{
    case Small
    case Medium
    case Large
}

struct Order: Codable {
    let name: String
    let coffeeName: String
    let total: Double
    let size: String
}
