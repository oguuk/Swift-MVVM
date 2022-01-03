//
//  AddCoffeeViewModel.swift
//  Coffee
//
//  Created by 오국원 on 2022/01/03.
//

import Foundation

struct AddCoffeeOrderViewModel {
    var name: String?
    var email: String?
    
    var types: [String] {
        return Coffeename.allCases.map {$0.rawValue.capitalized }
    }
    
    var sizes: [String]{
        return CoffeeSize.allCases.map {$0.rawValue.capitalized }
    }
}
