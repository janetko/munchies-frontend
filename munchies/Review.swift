//
//  Review.swift
//  munchies
//
//  Created by Janet Olowe on 4/30/23.
//

import Foundation
//import UIKit


struct Review: Codable {
    var username: String
    var hall_id: Int
    var user_id: Int
    var date: Int
    var contents: String
    var with_image: Bool
    var review_id: Int
    var image_url: String // Convert UIImage to Data for JSON serialization
    var rating: Int

    init(username: String, hall_id: Int, user_id: Int, date: Int, contents: String, with_image: Bool, review_id: Int, image_url: String, rating: Int) {
        self.username = username
        self.hall_id = hall_id
        self.user_id = user_id
        self.date = date
        self.contents = contents
        self.with_image = with_image
        self.image_url = image_url
        self.rating = rating
        self.review_id = review_id
    }

//    enum CodingKeys: String, CodingKey {
//        case username
//        case date
//        case comment
//        case foodPicData = "foodPic"
//        case rating
//    }
//
//    // Decode foodPicData back to UIImage
//    var foodPic: UIImage {
//        return UIImage(data: foodPicData)!
//    }
}

struct ReviewResponse: Codable {
    var reviews: [Review]
}
