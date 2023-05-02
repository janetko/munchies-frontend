//
//  ReviewListViewController.swift
//  munchies
//
//  Created by Janet Olowe on 4/30/23.
//

import UIKit

import UIKit

class ReviewListViewController: UIViewController {

    let restaurant: Restaurant
    var reviews: [Review] = [
        Review(title: "Boneless Chicken", name: "Janet", comment: "Late night boneless chicken always hits."),
        Review(title: "Boba was mid", name: "Alden", comment: "The tea wasn't properly filtered."),
        Review(title: "Route 10", name: "Elvis", comment: "There's only one way and thats route 10.")
    ]
    let tableView = UITableView()

    init(restaurant: Restaurant) {
        self.restaurant = restaurant
        super.init(nibName: nil, bundle: nil)
    }

    init(review: Review) {
        self.restaurant = Restaurant(name: "", eatPicName: "")
        self.reviews = [review]
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(ReviewListTableViewCell.self, forCellReuseIdentifier: "ReviewCell")

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

}

extension ReviewListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) as! ReviewListTableViewCell
        let review = reviews[indexPath.row]

        cell.titleLabel.text = review.title
        cell.nameLabel.text = review.name
        cell.commentLabel.text = review.comment

        return cell
    }
}

extension ReviewListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let review = reviews[indexPath.row]

        print("Selected review: \(review.title)")

    }
}

