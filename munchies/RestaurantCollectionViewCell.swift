//
//  RestaurantTableViewCell.swift
//  munchies
//
//  Created by Janet Olowe on 4/30/23.
//

import UIKit

class RestaurantCollectionViewCell: UICollectionViewCell {
    
    let nameLabel = UILabel()
    let eatPicView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(eatPicView)
        eatPicView.translatesAutoresizingMaskIntoConstraints = false
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            eatPicView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            eatPicView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            eatPicView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            eatPicView.widthAnchor.constraint(equalToConstant: 50),
            eatPicView.heightAnchor.constraint(equalToConstant: 50),
            eatPicView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with restaurant: Restaurant) {
        nameLabel.text = restaurant.name
        eatPicView.image = UIImage(named: restaurant.eatPicName)
    }
    
}

