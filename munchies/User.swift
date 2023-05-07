//
//  User.swift
//  munchies
//
//  Created by Janet Olowe on 5/4/23.
//

import Foundation

struct User: Codable {
    var username: String
//    var password: String
    var email: String
    var user_id: Int

    init(username: String, email: String, user_id: Int) {
        self.username = username
//        self.password = password
        self.email = email
        self.user_id = user_id
    }
}


struct UserResponse: Codable {
    var user: [User]
}

