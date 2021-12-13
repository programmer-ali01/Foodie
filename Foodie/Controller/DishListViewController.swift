//
//  DishListViewController.swift
//  Foodie
//
//  Created by Alisena Mudaber on 10/10/21.
//

import UIKit
import ProgressHUD

let reuseIdentifier = "tableCell"

class DishListViewController: UIViewController {
    
    var category: DishCategory!
    
    let tableView = UITableView()
    
    var meals: [Dish] = [
  
    ]
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = category.title
        
        view.backgroundColor = .systemBackground
        tableViewSetup()
        
        ProgressHUD.show()
        NetworkService.shared.fetchCategoryDishes(categoryId: category.id ?? "") { [weak self](result) in
            switch result {
                
            case .success(let dishes):
                ProgressHUD.dismiss()
                self?.meals = dishes
                self?.tableView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
        
    }
    
    func tableViewSetup() {
        tableView.register(DishListCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        // layout
        view.addSubview(tableView)
        tableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }
    
}

extension DishListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! DishListCell
        cell.setupView(dish: meals[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController()
        controller.dish = meals[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)   
    }
    
    
}
