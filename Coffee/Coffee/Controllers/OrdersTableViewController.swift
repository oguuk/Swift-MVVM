//
//  OrdersTableViewController.swift
//  Coffee
//
//  Created by 오국원 on 2021/12/29.
//

import Foundation
import UIKit

class OrdersTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        populateOrders()
    }
    private func populateOrders() {
        guard let coffeeOrdersURL = URL(string:"https://island-bramble.glitch.me/orders") else {
            fatalError("URL was incorre")
        }
        let resource = Resource<[Order]>(url: coffeeOrdersURL)
        Webservice().load(resource: resource) { result in
            switch result{
                case .success(let orders):
                    print(orders)
                case .failure(let error):
                    print(error)
            }
      }
  }
}
