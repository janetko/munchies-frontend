//
//  Review.swift
//  munchies
//
//  Created by Janet Olowe on 4/30/23.
//

import Foundation
import UIKit

class Review {
    var username: String
    var date: String
    var comment: String
    var foodPic: String
    var rating: String

    init(username: String, date: String, comment: String, foodPic: String, rating: String) {
        self.username = username
        self.date = date
        self.comment = comment
        self.foodPic = foodPic
        self.rating = rating
    }
}
