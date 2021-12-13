//
//  CategoryCell.swift
//  Foodie
//
//  Created by Alisena Mudaber on 9/15/21.
//

import UIKit

import ProgressHUD

class CategoryCell: UICollectionViewCell {

    static let identifier = "Cell"
    
    let navigation = UINavigationController()
    
    var homeViewController: HomeViewController?
  
    
 
    var categories: [DishCategory] = [
        
    ]
    
    var popularMeals: [Dish] = [
        
    ]
    
    var chefSpecial: [Dish] = [
 
    ]
    
    let diverLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let categoryName: UILabel = {
        let label = UILabel()
       // label.text = "Trending"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func layoutSubviews() {
        cardView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        ProgressHUD.show()
        NetworkService.shared.fetchAllCategories { [weak self] (result) in
            switch result {
            case .success(let allDishes):
                ProgressHUD.dismiss()
                self?.categories = allDishes.categories ?? []
                self?.popularMeals = allDishes.populars ?? []
                self?.chefSpecial = allDishes.specials ?? []
                
              
                self?.appsCollectionView.reloadData()
                
                
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
       
    }

    @objc func handleSegue() {
        let controller = DishDetailViewController()
        navigation.pushViewController(controller, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let appsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
      //  layout.estimatedItemSize = .zero
        
//        layout.minimumLineSpacing = 15
//        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
        
    }()
    
   
    
    
    func setupViews(title: ListTitle) {
        
   
        backgroundColor = .clear
        
        addSubview(appsCollectionView)
        
        addSubview(diverLineView)
        addSubview(categoryName)
        
        appsCollectionView.delegate = self
        appsCollectionView.dataSource = self
        
        
        appsCollectionView.register(AppCell.self, forCellWithReuseIdentifier: AppCell.cellId)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": categoryName]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": diverLineView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": appsCollectionView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[categoryName(30)][v0][v1(0.5)]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": appsCollectionView, "v1": diverLineView, "categoryName": categoryName]))
        
        categoryName.text = title.title
        
   
        
        
    }
}

extension CategoryCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch (categoryName.text) {
        case "Food Categories":
            return categories.count
        case "Popular Dishes":
            return popularMeals.count
        case "Chef's Special":
            return chefSpecial.count
        default:
            return 0
        }
        
        
//        if (categoryName.text == "Food Categories") {
//            return categories.count
//        }
//        if (categoryName.text == "Popular Dishes") {
//            return popularMeals.count
//        }
//        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppCell.cellId, for: indexPath) as! AppCell
        
        
        
        switch (categoryName.text) {
        case "Food Categories":
            cell.setupFoodCateogryView(category: categories[indexPath.row])
        case "Popular Dishes":
            cell.setupView(meal: popularMeals[indexPath.row])
        case "Chef's Special":
            cell.setupChefSpecial(meal: chefSpecial[indexPath.row])
        default:
            return cell
        }
       
        return cell

    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch(categoryName.text) {
        case "Foot Categories":
            return CGSize(width: 100, height: frame.height - 32)
        case "Popular Dishes":
            return CGSize(width: 120, height: frame.height - 40)
        case "Chef's Special":
            return CGSize(width: 100, height: frame.height - 50)
        default:
            return CGSize(width: 100, height: frame.height - 32)
        }
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        switch (categoryName.text) {
        case "Food Categories":
            return -25
        case "Popular Dishes":
            return 15
        case "Chef's Special":
            return 160
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if categoryName.text == "Food Categories" {
            let controller = DishListViewController()
            controller.category = categories[indexPath.row]
            homeViewController?.presentDishList(vc: controller)
        } else {
            let controller = DishDetailViewController()
            if categoryName.text == "Popular Dishes" {
                controller.dish = popularMeals[indexPath.row]
                homeViewController?.showDetail(vc: controller)
            } else if categoryName.text == "Chef's Special" {
                controller.dish = chefSpecial[indexPath.row]
                homeViewController?.showDetail(vc: controller)
            }
           
        }
        
//        switch (categoryName.text) {
//        case "Popular Dishes":
//            homeViewController?.showDetail()
//        case "Chef's Special":
//            homeViewController?.showDetail()
//        case "Food Categories":
//            homeViewController?.presentDishList()
//        default:
//            return
//        }
    }
}
