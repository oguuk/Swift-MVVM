//
//  Webservices.swift
//  StocksAppSwiftUI
//
//  Created by 오국원 on 2022/01/05.
//

import Foundation

class Webservice {
    
    func getTopNews(completion: @escaping (([Article]?) -> Void)) {
        
        guard let url = URL(string: "https://island-bramble.glitch.me/stocks") else {
                   fatalError("URL is not correct")
               }
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let articles = try? JSONDecoder().decode([Article].self, from: data)
            
            DispatchQueue.main.async {
                completion(articles)
            }
            
            
        }.resume()
        
        
    }
    
    func getStocks(completion: @escaping (([Stock]?) -> Void)) {
        
        guard let url = URL(string: "https://island-bramble.glitch.me/stocks") else {
            fatalError("URL is not correct")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            DispatchQueue.main.async {
                completion(stocks)
            }
            
        }.resume()
        
    }
    
}
