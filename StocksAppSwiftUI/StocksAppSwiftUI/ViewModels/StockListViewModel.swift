//
//  StockListViewModel.swift
//  StocksAppSwiftUI
//
//  Created by 오국원 on 2022/01/05.
//

import Foundation

class StockListViewModel: ObservableObject { //ObservableObject는 스스로 업데이트를 가능하게 함
    
    @Published var searchTerm: String = ""
    @Published var stocks: [StockViewModel] = [StockViewModel]()
    
    func load(){
        fetchStocks()
    }
    
    private func fetchStocks() {
        Webservice().getStocks { stocks in
            if let stocks  = stocks {
                DispatchQueue.main.async{
                    self.stocks = stocks.map(StockViewModel.init)
                }
                
            }
        }
    }
}
