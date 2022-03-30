//
//  Stock.swift
//  StocksAppSwiftUI
//
//  Created by 오국원 on 2022/01/05.
//

import Foundation

struct Stock:Decodable{
    let symbol: String
    let description: String
    let price: Double
    let change: String
}
