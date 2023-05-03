//
//  ViewController.swift
//  munchies
//
//  Created by Janet Olowe on 4/30/23.
//

import UIKit

class ViewController: UIViewController {
    
    let header = UIImageView()
    let footer = UIImageView()
    
    let heading = UILabel()
    
    let restaurants = [
        Restaurant(name: "Bear Necessities", eatPicName: "bear_necessities"),
        Restaurant(name: "Jansen's Market", eatPicName: "jansens"),
        Restaurant(name: "Bus Stop Bagels", eatPicName: "bus_stop")
    ]
    
    var restaurantCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 240/255, green: 137/255, blue: 128/255, alpha: 1)
        
//        title = "Munchies"
        
        header.image = UIImage(named: "header")
        header.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(header)
        

        footer.image = UIImage(named: "footer")
        footer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(footer)
        
        heading.textColor = UIColor(red: 1, green: 0.988, blue: 0.883, alpha: 1)
        heading.backgroundColor = .clear
        heading.font = UIFont(name: "Lato-Bold", size: 35)
        heading.text = "Dining Halls"
        heading.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(heading)

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
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.topAnchor),
            header.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            heading.topAnchor.constraint(equalTo: header.bottomAnchor),
            heading.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            heading.widthAnchor.constraint(equalToConstant: 196),
            heading.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        
        NSLayoutConstraint.activate([
            restaurantCollectionView.topAnchor.constraint(equalTo: heading.bottomAnchor),
            restaurantCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            restaurantCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            restaurantCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            footer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            footer.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

    }
    
    func showReviews(for restaurant: Restaurant) {
            let reviewsViewController = ReviewListViewController(restaurant: restaurant)
            navigationController?.pushViewController(reviewsViewController, animated: true)
        }

}

extension ViewController: UICollectionViewDataSource {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = restaurantCollectionView.dequeueReusableCell(withReuseIdentifier: "RestaurantCell", for: indexPath) as! RestaurantCollectionViewCell
        let restaurant = restaurants[indexPath.row]
        
        cell.backgroundColor = .red
    
        cell.configure(with: restaurant)
    
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - 20
        return CGSize(width: width, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let restaurant = restaurants[indexPath.row]
       showReviews(for: restaurant)
    }
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//         tableView.deselectRow(at: indexPath, animated: true)
//

//     }
}

