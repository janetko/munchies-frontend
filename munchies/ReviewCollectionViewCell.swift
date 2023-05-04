//
//  ReviewTableViewCell.swift
//  munchies
//
//  Created by Janet Olowe on 4/30/23.
//

import UIKit

class ReviewCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "ReviewListCell"
    
    let reviewBox = UIImageView()
    let usernameLabel = UILabel()
    let dateLabel = UILabel()
    let commentLabel = UILabel()
    let foodPicView = UIImageView()
    let rating = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        reviewBox.image = UIImage(named: "reviewbox")
        reviewBox.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(reviewBox)
        
        usernameLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        usernameLabel.textColor = UIColor(red: 0.753, green: 0.11, blue: 0.176, alpha: 1)
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(usernameLabel)
        
        dateLabel.font = UIFont.systemFont(ofSize: 17)
        dateLabel.textColor = UIColor(red: 0.753, green: 0.11, blue: 0.176, alpha: 1)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dateLabel)
        
        rating.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(rating)
        
        commentLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.numberOfLines = 0
        commentLabel.lineBreakMode = .byWordWrapping
        commentLabel.textAlignment = .left
        contentView.addSubview(commentLabel)
        
        foodPicView.translatesAutoresizingMaskIntoConstraints = false
        foodPicView.layer.cornerRadius = 12
        foodPicView.clipsToBounds = true
        contentView.addSubview(foodPicView)
        
        setupConstraints()
    }
    
    func setupConstraints() {

        NSLayoutConstraint.activate([
            reviewBox.topAnchor.constraint(equalTo: contentView.topAnchor),
            reviewBox.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            reviewBox.widthAnchor.constraint(equalToConstant: 354),
            reviewBox.heightAnchor.constraint(equalToConstant: 162)

        ])
        
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: reviewBox.topAnchor, constant: 17),
            usernameLabel.leadingAnchor.constraint(equalTo: reviewBox.leadingAnchor, constant: 20),
        ])
        
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: reviewBox.topAnchor, constant: 17),
            dateLabel.centerXAnchor.constraint(equalTo: reviewBox.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            rating.topAnchor.constraint(equalTo: reviewBox.topAnchor, constant: 17),
            rating.trailingAnchor.constraint(equalTo: reviewBox.trailingAnchor, constant: -20),
            rating.heightAnchor.constraint(equalToConstant: 18),
            rating.widthAnchor.constraint(equalToConstant: 100)

        ])
        
                                    
        NSLayoutConstraint.activate([
            commentLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 10),
            commentLabel.leadingAnchor.constraint(equalTo: reviewBox.leadingAnchor, constant: 20),
            commentLabel.widthAnchor.constraint(equalToConstant: 171),
            commentLabel.heightAnchor.constraint(equalToConstant: 90)
        ])
        
        NSLayoutConstraint.activate([
            foodPicView.topAnchor.constraint(equalTo: rating.bottomAnchor, constant: 10),
            foodPicView.trailingAnchor.constraint(equalTo: reviewBox.trailingAnchor, constant: -20),
            foodPicView.widthAnchor.constraint(equalToConstant: 113),
            foodPicView.heightAnchor.constraint(equalToConstant: 95),
        ])
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with review: Review) {
        usernameLabel.text = review.username
        dateLabel.text = review.date
        commentLabel.text = review.comment
        foodPicView.image = UIImage(named: review.foodPic)
        rating.image = UIImage(named: review.rating)
    }
}


