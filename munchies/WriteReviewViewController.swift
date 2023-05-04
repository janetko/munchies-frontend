//
//  WriteReviewViewController.swift
//  munchies
//
//  Created by Janet Olowe on 5/4/23.
//

import UIKit

class WriteReviewViewController: UIViewController {
    
    let header = UIImageView()
    let footer = UIImageView()
    let heading = UILabel()
    let backButton = UIButton()
    let submitButton = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        view.backgroundColor = UIColor(red: 240/255, green: 137/255, blue: 128/255, alpha: 1)

        header.image = UIImage(named: "header4")
        header.translatesAutoresizingMaskIntoConstraints = false
        header.backgroundColor = .clear
        view.addSubview(header)

        footer.image = UIImage(named: "footer")
        footer.backgroundColor = .clear
        footer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(footer)
        
        heading.textColor = UIColor(red: 1, green: 0.988, blue: 0.883, alpha: 1)
        heading.backgroundColor = .clear
        heading.font = UIFont(name: "Lato-Bold", size: 35)
        heading.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
        heading.text = "Trillium"
        heading.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(heading)
        
        backButton.setTitle("< Back", for: .normal)
        backButton.setTitleColor(UIColor(red: 1, green: 0.988, blue: 0.883, alpha: 1), for: .normal)
        backButton.backgroundColor = .clear
        backButton.titleLabel?.font = UIFont(name: "Lato-Bold", size: 20)
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)
        
        submitButton.setTitle("Submit", for: .normal)
        submitButton.setTitleColor(UIColor(red: 1, green: 0.988, blue: 0.883, alpha: 1), for: .normal)
        submitButton.backgroundColor = .clear
        submitButton.titleLabel?.font = UIFont(name: "Lato-Bold", size: 20)
        submitButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
//        submitButton.addTarget(self, action: #selector(submitReview(for: Restaurant)), for: .touchUpInside)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(submitButton)
        
        setupConstraints()

    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.topAnchor),
            header.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            footer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            footer.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            heading.topAnchor.constraint(equalTo: header.bottomAnchor),
            heading.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23),
            heading.widthAnchor.constraint(equalToConstant: 196),
            heading.heightAnchor.constraint(equalToConstant: 48)
        ]) 
        
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            backButton.bottomAnchor.constraint(equalTo: footer.bottomAnchor, constant: -36)
        ])
        
        NSLayoutConstraint.activate([
            submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            submitButton.bottomAnchor.constraint(equalTo: footer.bottomAnchor, constant: -36)
        ])
        
        
    }
    
    @objc func backButtonTapped() {
          if let reviewVC = navigationController?.viewControllers.first(where: { $0 is ReviewViewController }) {
              navigationController?.popToViewController(reviewVC, animated: true)
          }
      }
    
    func submitReview(for restaurant: Restaurant) {
            let reviewsVC = ReviewViewController(restaurant: restaurant)
            navigationController?.pushViewController(reviewsVC, animated: true)
        }


}
