//
//  ViewController.swift
//  munchies
//
//  Created by Janet Olowe on 4/30/23.
//

import UIKit

class ViewController: UIViewController {
    
    let restaurants = [
        Restaurant(name: "Bear Necessities", eatPicName: "bear_necessities"),
        Restaurant(name: "Jansen's Market", eatPicName: "jansens"),
        Restaurant(name: "Bus Stop Bagels", eatPicName: "bus_stop")
    ]
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Munchies"
        
        tableView.register(RestaurantTableViewCell.self, forCellReuseIdentifier: "RestaurantCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func showReviews(for restaurant: Restaurant) {
            let reviewsViewController = ReviewListViewController(restaurant: restaurant)
            navigationController?.pushViewController(reviewsViewController, animated: true)
        }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath)
         let restaurant = restaurants[indexPath.row]

         cell.textLabel?.text = restaurant.name
         cell.imageView?.image = UIImage(named: restaurant.eatPicName)

         return cell
     }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         tableView.deselectRow(at: indexPath, animated: true)

         let restaurant = restaurants[indexPath.row]
        showReviews(for: restaurant)
     }
}

