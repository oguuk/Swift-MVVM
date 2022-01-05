//
//  Webservices.swift
//  StocksAppSwiftUI
//
//  Created by 오국원 on 2022/01/05.
//

import Foundation

class Webservice {
    func getStocks(completion: @escaping (([Stock]?) -> Void)) {
        guard let url = URL(string: "https://island-bramble.glitch.me/stocks") else {
            fatalError("URL is no correct")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error ==  nil else {
                completion(nil)
                return
            }
            
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            stocks == nil ? completion(nil) : completion(stocks)
            
        }.resume()
    }
}
