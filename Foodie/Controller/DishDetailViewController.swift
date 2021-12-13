//
//  DishDetailViewController.swift
//  Foodie
//
//  Created by Alisena Mudaber on 10/8/21.
//

import UIKit
import ProgressHUD
//let identifier = "Dish"




class DishDetailViewController: UIViewController {
    
    var dish: Dish? = nil

    let coverImage: UIImageView = {
        let iv = UIImageView()
//
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let mealName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .darkGray
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .darkGray
        
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let description = UILabel()
        description.font = UIFont.systemFont(ofSize: 13)
        description.numberOfLines = 0
        description.contentMode = .scaleToFill
        description.lineBreakMode = .byWordWrapping
      //  description.textAlignment = .center
        return description
        
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter name"
        textField.borderStyle = .bezel
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Order", for: .normal)
        button.backgroundColor = .systemOrange
        button.tintColor = .white
        
        
        button.layer.cornerRadius = 10
        button.setDimensions(width: 200, height: 50)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        ProgressHUD.show()
//        NetworkService.shared.fetchAllCategories { [weak self] (result) in
//            switch result {
//            case .success(let allDishes):
//                ProgressHUD.dismiss()
//                self?.meals = allDishes.populars
//
//
//
//            case .failure(let error):
//                ProgressHUD.showError(error.localizedDescription)
//            }
//        }
       
        
        view.backgroundColor = .systemBackground
        setupView()
        
    }
    
    func setupView() {
        view.addSubview(coverImage)
        coverImage.setDimensions(width: view.frame.width, height: view.frame.height - (view.frame.height / 2))
       
        coverImage.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        coverImage.centerX(inView: view)
        
        view.addSubview(mealName)
        mealName.anchor(top: coverImage.bottomAnchor, left: view.leftAnchor, paddingTop: 20, paddingLeft: 20)
      
//
//        view.addSubview(priceLabel)
//        priceLabel.anchor(top: coverImage.bottomAnchor, right: view.rightAnchor, paddingTop: 20, paddingRight: 20)
//        priceLabel.text = "12.99"
        
        view.addSubview(descriptionLabel)
        descriptionLabel.setDimensions(width: view.frame.width / 1.1, height: 50)
        descriptionLabel.anchor(top: mealName.bottomAnchor, left: view.leftAnchor, paddingTop: 30, paddingLeft: 20)
    
        view.addSubview(nameTextField)
        nameTextField.anchor(top: descriptionLabel.bottomAnchor, paddingTop: 30)
        nameTextField.setDimensions(width: view.frame.width / 1.2, height: 40)
        nameTextField.centerX(inView: view)
        
        
        view.addSubview(actionButton)
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 20)
        actionButton.centerX(inView: view)
        actionButton.addTarget(self, action: #selector(placeOrder), for: .touchUpInside)
        
        coverImage.kf.setImage(with: dish?.image?.asUrl)
        mealName.text = dish?.name
        descriptionLabel.text = dish?.description
       
    
        
    }
    
    @objc func placeOrder() {
        guard let name = nameTextField.text?.trimmingCharacters(in: .whitespaces), !name.isEmpty else {
            
            ProgressHUD.showError("Please enter your name")
            return
            
        }
        ProgressHUD.show("Placing Order")
        NetworkService.shared.placeOrder(dishId: dish?.id ?? "", name: name) { (result) in
            switch result {
            case .success(_):
                ProgressHUD.showSuccess("Your order has been received.")
                
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
    
}



