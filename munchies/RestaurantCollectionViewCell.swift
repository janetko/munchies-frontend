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
    
    let titlebox = UIImageView()
    let rates = UIImageView()

    
    override init(frame: CGRect) {
        super.init(frame: frame)

        eatPicView.translatesAutoresizingMaskIntoConstraints = false
        eatPicView.layer.cornerRadius = 27
        eatPicView.clipsToBounds = true
        contentView.addSubview(eatPicView)
        
        titlebox.image = UIImage(named: "titlebox")
        titlebox.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titlebox)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        nameLabel.backgroundColor = .clear
        nameLabel.font = UIFont(name: "Lato-Bold", size: 16)
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        contentView.addSubview(nameLabel)
        
        rates.translatesAutoresizingMaskIntoConstraints = false
        rates.image = UIImage(named: "stars")
        contentView.addSubview(rates)

        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: eatPicView.bottomAnchor, constant: -34),
            nameLabel.leadingAnchor.constraint(equalTo: titlebox.leadingAnchor, constant: 13),
        ])
        
        NSLayoutConstraint.activate([
            rates.topAnchor.constraint(equalTo: eatPicView.bottomAnchor, constant: -34),
            rates.trailingAnchor.constraint(equalTo: titlebox.trailingAnchor, constant: -13),
            rates.heightAnchor.constraint(equalToConstant: 18),
            rates.widthAnchor.constraint(equalToConstant: 100)

        ])
        
        NSLayoutConstraint.activate([
            titlebox.topAnchor.constraint(equalTo: eatPicView.bottomAnchor, constant: -49),
            titlebox.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titlebox.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titlebox.widthAnchor.constraint(equalToConstant: 357),
            titlebox.heightAnchor.constraint(equalToConstant: 56)

        ])
        
        NSLayoutConstraint.activate([
            eatPicView.topAnchor.constraint(equalTo: contentView.topAnchor),
            eatPicView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            eatPicView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            eatPicView.widthAnchor.constraint(equalToConstant: 357),
            eatPicView.heightAnchor.constraint(equalToConstant: 172),
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
