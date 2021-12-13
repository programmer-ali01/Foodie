//
//  OrderList.swift
//  Foodie
//
//  Created by Alisena Mudaber on 12/5/21.
//

import UIKit
import ProgressHUD


class OrderListController: UIViewController {
    
    var orders: [Order] = [

    ]
    
    let cellID = "tableViewCell"
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        navigationBarUI()
        tableViewSetup()
        tableViewLayout()
        
        ProgressHUD.show()
 
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NetworkService.shared.fetchOrders { [weak self](result) in
            switch result {
                
            case .success(let orders):
                ProgressHUD.dismiss()
                self?.orders = orders
                self?.tableView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
            
        }
    }
    
    func navigationBarUI() {
        navigationController?.navigationItem.backButtonTitle = " "
        navigationController?.navigationItem.title = "Orders"
    }
    
    func tableViewSetup() {
        
        tableView.register(DishListCell.self, forCellReuseIdentifier: cellID)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableViewLayout() {
        view.addSubview(tableView)
       
         tableView.translatesAutoresizingMaskIntoConstraints = false
         tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
         tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
         tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
         tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    
}

extension OrderListController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! DishListCell
        cell.setupOrder(order: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
    

    
    
}
