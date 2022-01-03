//
//  Orders.swift
//  Coffee
//
//  Created by 오국원 on 2021/12/29.
//

import Foundation

enum Coffeename: String, Codable, CaseIterable{
    case cappuccino
    case latte
    case espressino
    case cortado
}

enum CoffeeSize: String, Codable, CaseIterable{
    case small
    case medium
    case large
}

struct Order: Codable {
    let name: String
    let coffeeName: Coffeename
    let total: Double
    let size: CoffeeSize
}
