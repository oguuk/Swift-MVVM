//
//  OrderViewModel.swift
//  Coffee
//
//  Created by 오국원 on 2021/12/29.
//

import Foundation

class OrderListViewModel {//make sure of all the data that displayed on my order table
                          //table view controller
    var ordersViewModel: [OrderViewModel]
    
    init(){
        self.ordersViewModel = [OrderViewModel]()
    }
}

extension OrderListViewModel {
    func orderViewModel(at index: Int) -> OrderViewModel {
        return self.ordersViewModel[index]
    }
}
struct OrderViewModel {
    let order: Order
}

extension OrderViewModel {
    
    var name: String {
        return self.order.name
    }
    var coffeename: String {
        return self.order.coffeeName.capitalized
    }
    
    var total: Double {
        return self.order.total
    }
    
    var size: String {
        return self.order.size.fastestEncoding.rawValue.description.capitalized
    }
}
 
