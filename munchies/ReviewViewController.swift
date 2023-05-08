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

    var restaurant: Restaurant
    
    let refreshControl = UIRefreshControl()
    

    
//    var shownReviewsData: [Review] = []
    
    let user: User

    init(restaurant: Restaurant, user: User) {
        self.restaurant = restaurant
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }

    init(review: Review, user: User) {
        self.restaurant = Restaurant(name: "", eatPicName: "", rating: 0, hall_id: 0, reviews: [])
        self.user = user
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
                
        // Remove UINavBar background color
        let app = UINavigationBarAppearance()
        app.configureWithTransparentBackground()
        self.navigationController?.navigationBar.standardAppearance = app
        self.navigationController?.navigationBar.scrollEdgeAppearance = app
        self.navigationController?.navigationBar.compactAppearance = app
        
        let reviewFlowLayout = UICollectionViewFlowLayout()
        reviewFlowLayout.scrollDirection = .vertical
        reviewFlowLayout.minimumLineSpacing = 10
        
        reviewCollectionView = UICollectionView(frame: .zero, collectionViewLayout: reviewFlowLayout)
        reviewCollectionView.register(ReviewCollectionViewCell.self, forCellWithReuseIdentifier: "ReviewCell")
        
        reviewCollectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 50, right: 0)

        reviewCollectionView.backgroundColor = .clear
        reviewCollectionView.dataSource = self
        reviewCollectionView.delegate = self
        reviewCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(reviewCollectionView)
                
        header.image = UIImage(named: "header3")
        header.translatesAutoresizingMaskIntoConstraints = false
        header.backgroundColor = .clear
        view.addSubview(header)

        heading.textColor = UIColor(red: 1, green: 0.988, blue: 0.883, alpha: 1)
        heading.backgroundColor = .clear
        heading.font = UIFont(name: "ChelseaMarket-Regular", size: 50)
        heading.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        heading.text = restaurant.name
        heading.textAlignment = .center
        heading.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(heading)
        
        footer.image = UIImage(named: "footer")
        footer.backgroundColor = .clear
        footer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(footer)
        
        //TODO: #1.5 Setup refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        
        if #available(iOS 10.0, *) {
            reviewCollectionView.refreshControl = refreshControl
        } else {
            reviewCollectionView.addSubview(refreshControl)
        }
        
        
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
        refreshData()

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
            reviewCollectionView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: -39),
            reviewCollectionView.bottomAnchor.constraint(equalTo: footer.topAnchor, constant: 39),
            reviewCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            reviewCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            heading.topAnchor.constraint(equalTo: header.bottomAnchor, constant: -92),
            heading.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            heading.widthAnchor.constraint(equalToConstant: 390),
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
        let writeReviewVC = WriteReviewViewController(restaurant: self.restaurant, user: self.user, delegate: self)
            navigationController?.pushViewController(writeReviewVC, animated: true)
    }
    
    @objc func backButtonTapped() {
//        NetworkManager.shared.getAllRestaurants { restaurants in
//        }
          if let restaurantVC = navigationController?.viewControllers.first(where: { $0 is RestaurantViewController }) {
              navigationController?.popToViewController(restaurantVC, animated: true)
          }
      }
    
    @objc func deleteButtonTapped(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: reviewCollectionView)
        if let indexPath = reviewCollectionView.indexPathForItem(at: point) {
            // handle deletion of cell at indexPath
            let review = restaurant.reviews[indexPath.row]
            self.deleteCell(at: indexPath)
            NetworkManager.shared.deleteReview(hall_id: restaurant.hall_id, review_id: review.review_id) { response in
                
                NetworkManager.shared.getRestaurant(hall_id: self.restaurant.hall_id) { response in
                    DispatchQueue.main.sync {

                        let reviewsVC = ReviewViewController(restaurant: response, user: self.user)
                        self.navigationController?.pushViewController(reviewsVC, animated: true)
                    }
                }
            }

        }
    }
    
    @objc func refreshData() {
        //TODO: Refresh Data

        NetworkManager.shared.getAllRestaurants { restaurants in
            DispatchQueue.main.sync {
//                self.shownReviewsData = self.restaurant.reviews
                self.reviewCollectionView.reloadData()
                self.refreshControl.endRefreshing()
            }
        }

    }
    

}

extension ReviewViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return shownReviewsData.count
        return restaurant.reviews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = reviewCollectionView.dequeueReusableCell(withReuseIdentifier: "ReviewCell", for: indexPath) as! ReviewCollectionViewCell
        let review = restaurant.reviews[indexPath.row]
//        let review = shownReviewsData[indexPath.row]

            
        cell.configure(with: review)
        cell.displayImages(from: review.image_url)
        
        if user.user_id == review.user_id {
            cell.deleteButton.isHidden = false
            cell.deleteButton.addTarget(self, action: #selector(deleteButtonTapped(_:)), for: .touchUpInside)
        }

    
        return cell
    }
    
    func deleteCell(at indexPath: IndexPath) {
        restaurant.reviews.remove(at: indexPath.row)
//            shownReviewsData.remove(at: indexPath.row)
            reviewCollectionView.deleteItems(at: [indexPath])
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

extension ReviewViewController: ReloadViewDelegate {
    func reloadView() {
        reviewCollectionView.reloadData()
    }    
}
