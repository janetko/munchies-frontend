//
//  RestaurantTableViewCell.swift
//  munchies
//
//  Created by Janet Olowe on 4/30/23.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
    
    let nameLabel = UILabel()
    let eatPicView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(eatPicView)
        eatPicView.translatesAutoresizingMaskIntoConstraints = false
        
        setupConstraints()
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            eatPicView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            eatPicView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            eatPicView.widthAnchor.constraint(equalToConstant: 50),
            eatPicView.heightAnchor.constraint(equalToConstant: 50)
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

