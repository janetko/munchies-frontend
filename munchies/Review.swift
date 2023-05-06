//
//  Review.swift
//  munchies
//
//  Created by Janet Olowe on 4/30/23.
//

import Foundation
import UIKit

//struct Review {
//    var username: String
//    var date: String
//    var comment: String
//    var foodPic: UIImage // this is the problem
//    var rating: String
//
//    init(username: String, date: String, comment: String, foodPic: UIImage, rating: String) {
//        self.username = username
//        self.date = date
//        self.comment = comment
//        self.foodPic = foodPic
//        self.rating = rating
//    }
//}
//
//struct ReviewResponse: Codable {
//    var reviews: [Review]
//}


struct Review: Codable {
    var username: String
    var date: String
    var comment: String
    var foodPicData: Data // Convert UIImage to Data for JSON serialization
    var rating: String

    init(username: String, date: String, comment: String, foodPic: UIImage, rating: String) {
        self.username = username
        self.date = date
        self.comment = comment
        self.foodPicData = foodPic.pngData()! // Convert UIImage to Data
        self.rating = rating
    }

    enum CodingKeys: String, CodingKey {
        case username
        case date
        case comment
        case foodPicData = "foodPic"
        case rating
    }

    // Decode foodPicData back to UIImage
    var foodPic: UIImage {
        return UIImage(data: foodPicData)!
    }
}

struct ReviewResponse: Codable {
    var reviews: [Review]
}
