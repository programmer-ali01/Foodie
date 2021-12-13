//
//  AppCell.swift
//  Foodie
//
//  Created by Alisena Mudaber on 9/15/21.
//

import UIKit

import Kingfisher

class AppCell: UICollectionViewCell {
 
    
    
    static let cellId = "CellID"

    
    let navigation = UINavigationController()
    
    let imageView: UIImageView = {
        let iv = UIImageView()
       // iv.image = UIImage(named: "orion")
        // maintains aspect ratio of image
        iv.contentMode = .scaleAspectFill
        
        iv.layer.cornerRadius = 8
        iv.layer.masksToBounds = true
        iv.layer.borderWidth = 0.5
        
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
     //   label.text = "Fast Food"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .darkGray
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
     //   label.text = "3.99"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .darkGray
        return label
    }()
    
    let mealDescription: UILabel = {
        let description = UILabel()
        description.numberOfLines = 0
        description.contentMode = .scaleToFill
        description.lineBreakMode = .byWordWrapping
      //  description.textAlignment = .center
        return description
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
      
    }
    
    required init?(coder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: coder)
        
    }
    

    

//    override func prepareForReuse() {
//        super.prepareForReuse()
//
//    }
    
    override func layoutSubviews() {
        cardView()
    }

    
    func setupFoodCateogryView(category: DishCategory? = nil) {
        addSubview(imageView)
        addSubview(nameLabel)
    
       // imageView.frame = CGRect(x: 0, y: 0, width: frame.width / 1.5, height: frame.height / 1.5)
        imageView.setDimensions(width: frame.width/1.6, height: frame.height/1.6)
        imageView.anchor(top: topAnchor, left: leftAnchor)
        imageView.layer.cornerRadius = 8
        imageView.addSubview(nameLabel)
        
        nameLabel.centerX(inView: imageView)
        nameLabel.centerY(inView: imageView)
        nameLabel.textAlignment = .center
        nameLabel.contentMode = .scaleAspectFill
        nameLabel.numberOfLines = 0
        nameLabel.textColor = .black
        nameLabel.lineBreakMode = .byWordWrapping
        nameLabel.setDimensions(width: 60, height: 60)
        nameLabel.font = UIFont.boldSystemFont(ofSize: 14)
        
    
        imageView.kf.setImage(with: category?.image?.asUrl)
        nameLabel.text = category?.title
        
    }
    
    func setupView(meal: Dish? = nil) {
        
        addSubview(imageView)
        addSubview(nameLabel)
     //   addSubview(categoryLabel)
     //   addSubview(priceLabel)
        
        nameLabel.font = UIFont.systemFont(ofSize: 12)
        nameLabel.contentMode = .scaleToFill
        nameLabel.numberOfLines = 0
        nameLabel.lineBreakMode = .byWordWrapping
        
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width / 1.2, height: frame.width / 1.2)
        nameLabel.frame = CGRect(x: 0, y: frame.width+2, width: frame.width/1.5, height: 40)
      //  categoryLabel.frame = CGRect(x: 0, y: frame.width + 42, width: frame.width, height: 20)
    //    priceLabel.frame = CGRect(x: 0, y: frame.width + 56, width: frame.width, height: 20)
        
        imageView.kf.setImage(with: meal?.image?.asUrl)
        nameLabel.text = meal?.name
     //   categoryLabel.text = meal?.categoryName
      //  priceLabel.text = meal?.formattedPrice
        
        
    }
    
    func setupChefSpecial(meal: Dish? = nil) {
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(mealDescription)
        
        imageView.frame = CGRect(x: 0, y: 10, width: frame.width / 1.5, height: frame.width / 1.5)
        nameLabel.setDimensions(width: 50, height: 20)
        nameLabel.anchor(top: topAnchor, left: imageView.rightAnchor, paddingTop: 10, paddingLeft: 20)
        nameLabel.font = UIFont.boldSystemFont(ofSize: 13)
        nameLabel.textColor = .black
        
        mealDescription.anchor(top: nameLabel.bottomAnchor, left: imageView.rightAnchor, paddingLeft: 20)
        mealDescription.font = UIFont.systemFont(ofSize: 11)
        mealDescription.textColor = .black
        mealDescription.setDimensions(width: 150, height: frame.width - 20)
        
        imageView.kf.setImage(with: meal?.image?.asUrl)
        nameLabel.text = meal?.name
        mealDescription.text = meal?.description
    }
    

    
    
    
}

//extension AppCell: UICollectionViewDataSource, UICollectionViewDelegate {
//
//
////    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
////
////            let vc = DishDetailViewController();
////            self.delegate?.pushNavigation(vc);
////
////
////
////    }
//}
//
//
