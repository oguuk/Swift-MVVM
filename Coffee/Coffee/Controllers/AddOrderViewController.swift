//
//  AddOrderViewController.swift
//  Coffee
//
//  Created by 오국원 on 2021/12/29.
//

import Foundation
import UIKit

class AddOrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var vm = AddCoffeeOrderViewModel()//관련된 모든 data를 제공
    @IBOutlet weak var tableView: UITableView!
    private var coffeeSizeSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        //self.tableView.delegate = self 스토리보드로도 구현가능
        //self.tableView.dataSource = self 스토리보드로도 구현가능
    }
    private func setupUI(){//storyboard말고 코드로 small medium large 버튼을 구현
        self.coffeeSizeSegmentedControl = UISegmentedControl(items: self.vm.sizes)
        self.coffeeSizeSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.coffeeSizeSegmentedControl)
        
        self.coffeeSizeSegmentedControl.topAnchor.constraint(equalTo:self.tableView.bottomAnchor, constant: 20).isActive = true
    
        self.coffeeSizeSegmentedControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vm.types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeTypeTableViewCell", for: indexPath)
        cell.textLabel?.text = self.vm.types[indexPath.row]
        return cell
    }
    
}
