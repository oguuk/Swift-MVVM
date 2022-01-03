//
//  OrdersTableViewController.swift
//  Coffee
//
//  Created by 오국원 on 2021/12/29.
//

import Foundation
import UIKit

class OrdersTableViewController: UITableViewController {
    
    var orderListViewModel = OrderListViewModel()
    //View가 필요로하는 어떠한 데이타든 supply해줌
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateOrders()
    }
    private func populateOrders() {
        guard let coffeeOrdersURL = URL(string:"https://island-bramble.glitch.me/orders") else {
            fatalError("URL was incorre")
        }
        let resource = Resource<[Order]>(url: coffeeOrdersURL)
        Webservice().load(resource: resource) { [weak self]result in
            switch result{
                case .success(let orders)://result of Web service
                self?.orderListViewModel.ordersViewModel = orders.map(OrderViewModel.init)
                self?.tableView.reloadData()
                case .failure(let error):
                    print(error)
            }
      }
  }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderListViewModel.ordersViewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {//get people's order
        let vm = self.orderListViewModel.orderViewModel(at: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath)
        
        cell.textLabel?.text = vm.coffeename
        cell.detailTextLabel?.text = vm.size
        
        return cell
    }
}
