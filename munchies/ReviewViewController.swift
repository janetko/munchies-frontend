//
//  ReviewListViewController.swift
//  munchies
//
//  Created by Janet Olowe on 4/30/23.
//

import UIKit


class ReviewViewController: UIViewController {
    
    let header = UIImageView()
    let footer = UIImageView()
    let heading = UILabel()
    let backButton = UIButton()
    let reviewButton = UIButton()

    let restaurant: Restaurant
    var reviews: [Review] = [
        Review(username: "janetko", date: "1/2/23", comment: "food is great!", foodPic: "foodpic1", rating: "stars5"),
        Review(username: "emmando", date: "2/2/23", comment: "yum! so many options. I love this place!", foodPic: "foodpic2", rating: "stars4"),
        Review(username: "andrefo", date: "4/3/23", comment: "food is bland", foodPic: "foodpic3", rating: "stars1"),
        Review(username: "elvisma", date: "5/4/23", comment: "food is good!", foodPic: "foodpic4", rating: "stars3")
    ]

    init(restaurant: Restaurant) {
        self.restaurant = restaurant
        super.init(nibName: nil, bundle: nil)
    }

    init(review: Review) {
        self.restaurant = Restaurant(name: "", eatPicName: "", rating: "")
        self.reviews = [review]
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var reviewCollectionView: UICollectionView!


    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        view.backgroundColor = UIColor(red: 240/255, green: 137/255, blue: 128/255, alpha: 1)
        
        let reviewFlowLayout = UICollectionViewFlowLayout()
        reviewFlowLayout.scrollDirection = .vertical
        reviewFlowLayout.minimumLineSpacing = 10
    
        reviewCollectionView = UICollectionView(frame: .zero, collectionViewLayout: reviewFlowLayout)
        reviewCollectionView.register(ReviewCollectionViewCell.self, forCellWithReuseIdentifier: "ReviewCell")
        reviewCollectionView.backgroundColor = .clear
        reviewCollectionView.dataSource = self
        reviewCollectionView.delegate = self
        reviewCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(reviewCollectionView)
        
        header.image = UIImage(named: "header3")
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
        
        reviewButton.setTitle("Write A Review", for: .normal)
        reviewButton.setTitleColor(UIColor(red: 1, green: 0.988, blue: 0.883, alpha: 1), for: .normal)
        reviewButton.backgroundColor = .clear
        reviewButton.titleLabel?.font = UIFont(name: "Lato-Bold", size: 20)
        reviewButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        reviewButton.addTarget(self, action: #selector(reviewButtonTapped), for: .touchUpInside)
        reviewButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(reviewButton)

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
            reviewCollectionView.topAnchor.constraint(equalTo: heading.bottomAnchor, constant: 10),
            reviewCollectionView.bottomAnchor.constraint(equalTo: footer.topAnchor, constant: 39),
            reviewCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            reviewCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
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
            reviewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            reviewButton.bottomAnchor.constraint(equalTo: footer.bottomAnchor, constant: -36)
        ])
    }
    
    @objc func reviewButtonTapped() {
            let writeReviewVC = WriteReviewViewController()
            navigationController?.pushViewController(writeReviewVC, animated: true)
    }
    
    @objc func backButtonTapped() {
          if let restaurantVC = navigationController?.viewControllers.first(where: { $0 is RestaurantViewController }) {
              navigationController?.popToViewController(restaurantVC, animated: true)
          }
      }

}

extension ReviewViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = reviewCollectionView.dequeueReusableCell(withReuseIdentifier: "ReviewCell", for: indexPath) as! ReviewCollectionViewCell
        let review = reviews[indexPath.row]
            
        cell.configure(with: review)
    
        return cell
    }
}

extension ReviewViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 357, height: 172)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // Return the minimum spacing between cells vertically
        return 6
    }

}

