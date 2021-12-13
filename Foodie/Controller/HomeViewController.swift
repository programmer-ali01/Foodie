//
//  HomeViewController.swift
//  Foodie
//
//  Created by Alisena Mudaber on 9/13/21.
//

import UIKit
import ProgressHUD




class HomeViewController: UICollectionViewController {
    
    // properties

    

    
    let navigation = UINavigationController()
    
    let appCell = AppCell()

    let categoryName = CategoryCell()
    
    var listTitles: [ListTitle] = [
        .init(title: "Food Categories"),
        .init(title: "Popular Dishes"),
        .init(title: "Chef's Special"),
    ]
    
    var categories: [DishCategory] = [
        
    ]
    
    var popularMeals: [Dish] = [
        
    ]
    
    var chefSpecial: [Dish] = [
 
    ]
    
   // var categories: []
    
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //   let layout = UICollectionViewFlowLayout.init()
     
        //collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
      //  HomeViewController(collectionViewLayout: layout)
        
        view.accessibilityIdentifier = "homeViewController"
        
        collectionView.backgroundColor = .systemBackground
        configureNavigationBar()
        configureScrollView()
        
        setupCollectionView()
        
    }

    
    override func viewWillLayoutSubviews() {
      super.viewWillLayoutSubviews()
       // collectionViewLayout.invalidateLayout()
    }
    
    func setupCollectionView() {
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    func configureNavigationBar() {
        navigationItem.title = ""
        navigationController?.hidesBarsOnSwipe = true
        navigationController?.navigationBar.topItem?.setRightBarButton(UIBarButtonItem.init(image: UIImage(systemName: "cart.circle.fill"), style: .plain, target: self, action: #selector(cartButtonPressed)), animated: true)
        navigationController?.navigationBar.topItem?.rightBarButtonItem?.tintColor = .darkGray
        
    }
    
    func configureScrollView() {
        scrollView.delegate = self
        scrollView.frame = view.bounds
    }
    
    func showDetail(vc: UIViewController) {
      
       // let vc = DishDetailViewController()
        navigationController?.pushViewController(vc, animated: true)
            
    }
    
    func presentDishList(vc: UIViewController) {
       // let vc = DishListViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    
    }
    
    // selectors
    
    @objc func cartButtonPressed() {
        let controller = OrderListController()
        navigationController?.pushViewController(controller, animated: true)
    }
}


extension HomeViewController: UICollectionViewDelegateFlowLayout {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listTitles.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as! CategoryCell
        cell.setupViews(title: listTitles[indexPath.row])
        cell.homeViewController = self
        return cell
    }
    

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch (listTitles[indexPath.row].title) {
        case "Food Categories":
            return CGSize(width: view.frame.width, height: 130)
        case "Chef's Special":
            return CGSize(width: view.frame.width, height: 170)
        default:
            return CGSize(width: view.frame.width, height: 250)
        }
        
//        if (listTitles[indexPath.row].title == "Food Categories") {
//            return CGSize(width: view.frame.width, height: 130)
//        }
//
//        return CGSize(width: view.frame.width, height: 280)
        
        
    }
    
    
    
   

    
}

//extension HomeViewController: HomeCellProtocol {
//    func pushNavigation(_ vc: UIViewController) {
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
//
//}




