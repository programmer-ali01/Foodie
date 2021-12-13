//
//  DishListCell.swift
//  Foodie
//
//  Created by Alisena Mudaber on 10/10/21.
//

import UIKit
import Kingfisher

let identifier = "tableViewCell"
class DishListCell: UITableViewCell {
    
 
    
    let dishImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 5
        return iv
        
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .darkGray
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let description = UILabel()
        description.font = UIFont.systemFont(ofSize: 12)
        description.numberOfLines = 0
        description.contentMode = .scaleToFill
        description.lineBreakMode = .byWordWrapping
      //  description.textAlignment = .center
        return description
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
    }
    
    func setupView(dish: Dish) {
        
        addSubview(dishImage)
      //  dishImage.frame = CGRect(x: 0, y: 0, width: frame.width / 50, height: frame.height / 50)
        dishImage.anchor(top: topAnchor, left: leftAnchor, paddingTop: 30, paddingLeft: 20)
        dishImage.setDimensions(width: frame.width/8, height: frame.height/4)
        dishImage.layer.cornerRadius = 5
        
        addSubview(nameLabel)
        nameLabel.anchor(top: topAnchor, left: dishImage.rightAnchor, paddingTop: 20, paddingLeft: 20)
        
        addSubview(descriptionLabel)
        descriptionLabel.anchor(top: nameLabel.bottomAnchor, left: dishImage.rightAnchor, bottom: bottomAnchor, paddingTop: 5, paddingLeft: 20, paddingBottom: 20)
        descriptionLabel.contentMode = .scaleAspectFill
        
        
        dishImage.kf.setImage(with: dish.image?.asUrl)
        nameLabel.text = dish.name
        descriptionLabel.text = dish.description
        
    }
    
    func setupOrder(order: Order) {
        addSubview(dishImage)
        dishImage.anchor(top: topAnchor, left: leftAnchor, paddingTop: 20, paddingLeft: 20)
        dishImage.setDimensions(width: 30, height: 30)
        
        addSubview(nameLabel)
        nameLabel.anchor(top: topAnchor, left: dishImage.rightAnchor, paddingTop: 20, paddingLeft: 20)
        
        addSubview(descriptionLabel)
        descriptionLabel.anchor(top: nameLabel.bottomAnchor, left: dishImage.rightAnchor, bottom: bottomAnchor, paddingTop: 5, paddingLeft: 20, paddingBottom: 20)
        descriptionLabel.contentMode = .scaleAspectFill
        
        dishImage.kf.setImage(with: order.dish?.image?.asUrl)
       // dishImage.image = order.dish?.image?.asUrl)
        nameLabel.text = order.dish?.name
        descriptionLabel.text = order.name
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
