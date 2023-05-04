//
//  ViewController.swift
//  munchies
//
//  Created by Janet Olowe on 4/30/23.
//

import UIKit

class RestaurantViewController: UIViewController {
    
    let header = UIImageView()
    let footer = UIImageView()
    
    let currUserLabel = UILabel()
    let logoutButton = UIButton()
    
//    let heading = UILabel()
    
    let restaurants = [
        Restaurant(name: "Trillium", eatPicName: "trillium", rating: "stars5"),
        Restaurant(name: "Bear Necessities", eatPicName: "bear_necessities", rating: "stars4"),
        Restaurant(name: "Jansen's Market", eatPicName: "jansens", rating: "stars3"),
        Restaurant(name: "Bus Stop Bagels", eatPicName: "bus_stop", rating: "stars2")
    ]
    
    var restaurantCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        view.backgroundColor = UIColor(red: 240/255, green: 137/255, blue: 128/255, alpha: 1)
        
//        title = "Munchies"
        
        let restaurantFlowLayout = UICollectionViewFlowLayout()
        restaurantFlowLayout.scrollDirection = .vertical
        restaurantFlowLayout.minimumLineSpacing = 10
        
        restaurantCollectionView = UICollectionView(frame: .zero, collectionViewLayout: restaurantFlowLayout)
        restaurantCollectionView.register(RestaurantCollectionViewCell.self, forCellWithReuseIdentifier: "RestaurantCell")
        
        restaurantCollectionView.backgroundColor = .clear
        restaurantCollectionView.dataSource = self
        restaurantCollectionView.delegate = self
        restaurantCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(restaurantCollectionView)
        
        header.image = UIImage(named: "header2")
        header.translatesAutoresizingMaskIntoConstraints = false
        header.backgroundColor = .clear
        view.addSubview(header)


        footer.image = UIImage(named: "footer")
        footer.backgroundColor = .clear
        footer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(footer)
        
//        heading.textColor = UIColor(red: 1, green: 0.988, blue: 0.883, alpha: 1)
//        heading.backgroundColor = .clear
//        heading.font = UIFont(name: "Lato-Bold", size: 35)
//        heading.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
//        heading.text = "Dining Halls"
//        heading.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(heading)

        currUserLabel.text = "Hi, janetko!"
        currUserLabel.textColor = UIColor(red: 1, green: 0.988, blue: 0.883, alpha: 1)
        currUserLabel.backgroundColor = .clear
        currUserLabel.font = UIFont(name: "Lato-Bold", size: 20)
        currUserLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        currUserLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(currUserLabel)
        
        logoutButton.setTitle("Log Out", for: .normal)
        logoutButton.setTitleColor(UIColor(red: 1, green: 0.988, blue: 0.883, alpha: 1), for: .normal)
        logoutButton.backgroundColor = .clear
        logoutButton.titleLabel?.font = UIFont(name: "Lato-Bold", size: 20)
        logoutButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoutButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.topAnchor),
            header.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
//        NSLayoutConstraint.activate([
//            heading.topAnchor.constraint(equalTo: header.bottomAnchor),
//            heading.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
//            heading.widthAnchor.constraint(equalToConstant: 196),
//            heading.heightAnchor.constraint(equalToConstant: 48)
//        ])
        
        NSLayoutConstraint.activate([
            footer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            footer.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            restaurantCollectionView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: -39),
            restaurantCollectionView.bottomAnchor.constraint(equalTo: footer.topAnchor, constant: 39),
            restaurantCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            restaurantCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            currUserLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            currUserLabel.bottomAnchor.constraint(equalTo: footer.bottomAnchor, constant: -42)
        ])
        
        NSLayoutConstraint.activate([
            logoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            logoutButton.bottomAnchor.constraint(equalTo: footer.bottomAnchor, constant: -36)
        ])
        
        
        
    }
    
    func showReviews(for restaurant: Restaurant) {
            let reviewsViewController = ReviewViewController(restaurant: restaurant)
            navigationController?.pushViewController(reviewsViewController, animated: true)
        }
    
    @objc func logoutButtonTapped() {
          if let loginVC = navigationController?.viewControllers.first(where: { $0 is LoginViewController }) {
              navigationController?.popToViewController(loginVC, animated: true)
          }
      }

}

extension RestaurantViewController: UICollectionViewDataSource {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = restaurantCollectionView.dequeueReusableCell(withReuseIdentifier: "RestaurantCell", for: indexPath) as! RestaurantCollectionViewCell
        let restaurant = restaurants[indexPath.row]
            
        cell.configure(with: restaurant)
        cell.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        cell.layer.shadowOpacity = 1
        cell.layer.shadowRadius = 4
        cell.layer.shadowOffset = CGSize(width: 0, height: 4)
    
        return cell
    }
    
}

extension RestaurantViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 357, height: 172)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // Return the minimum spacing between cells vertically
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let restaurant = restaurants[indexPath.row]
       showReviews(for: restaurant)
    }

}
