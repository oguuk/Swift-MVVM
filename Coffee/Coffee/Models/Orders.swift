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
    let email: String
    let size: CoffeeSize
}

extension Order {
    
    static var all: Resource<[Order]> = {
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {
            fatalError("URL is incorrect!")
        }
        return Resource<[Order]>(url: url)
    }()
    
    static func create(vm: AddCoffeeOrderViewModel) -> Resource<Order?>{
        let order = Order(vm)
        
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {
            fatalError("URL is incorrect!")
        }
        guard let data = try?JSONEncoder().encode(order) else {
            fatalError("Error encoding order!")
        }
        var resource = Resource<Order?>(url:url)
        resource.httpMethod = HttpMethod.post
        resource.body = data
        
        return resource
    }
}

extension Order {
    init?(_ vm: AddCoffeeOrderViewModel){
        
        guard let name = vm.name,
              let email = vm.email,
              let selectedType = Coffeename(rawValue: vm.selectedType!.lowercased()),
              let selectedSize = CoffeeSize(rawValue:  vm.selectedSize!.lowercased()) else{
                  return nil
              }
        self.name = name
        self.email = email
        self.coffeeName = selectedType
        self.size = selectedSize
        
    }
}
