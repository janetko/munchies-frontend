//
//  Review.swift
//  munchies
//
//  Created by Janet Olowe on 4/30/23.
//

import Foundation
import UIKit

class Review {
    var title: String
    var name: String
    var comment: String

    init(title: String, name: String, comment: String) {
        self.title = title
        self.name = name
        self.comment = comment
    }
}
