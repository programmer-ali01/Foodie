//
//  OnboardingCell.swift
//  Foodie
//
//  Created by Alisena Mudaber on 9/13/21.
//

import UIKit



class OnboardingCell: UICollectionViewCell {
    
    // properties
    
    lazy var slideImageView: UIImageView = {
        let iv = UIImageView()
        iv.setDimensions(width: frame.width - (frame.width / 2), height: frame.height - (frame.height / 1.4))
        return iv
    }()
    
    lazy var slideTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textAlignment = .center
        return label
    }()
    
    lazy var slideDescriptionLabel: UILabel = {
        let description = UILabel()
        description.font = UIFont.systemFont(ofSize: 15)
        description.numberOfLines = 0
        description.contentMode = .scaleToFill
        description.lineBreakMode = .byWordWrapping
        description.textAlignment = .center
        return description
    }()
    
    static let reuseIdentifier = "collection"
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
        
        configureCell()
    
        
    }
    
    func configureCell() {
        addSubview(slideImageView)
        slideImageView.anchor(top: safeAreaLayoutGuide.topAnchor, paddingTop: 120)
        slideImageView.centerX(inView: self)
        addSubview(slideTitleLabel)
        slideTitleLabel.anchor(top: slideImageView.bottomAnchor, paddingTop: 130)
        slideTitleLabel.centerX(inView: self)
        addSubview(slideDescriptionLabel)
        slideDescriptionLabel.setDimensions(width: 350, height: 80)
        slideDescriptionLabel.anchor(top: slideTitleLabel.bottomAnchor, paddingTop: 10)
        slideDescriptionLabel.centerX(inView: self)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()

    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForReuse()

    }
    
    func setup(_ slide: OnboardingSlide) {
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }
}
