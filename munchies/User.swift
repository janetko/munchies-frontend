//
//  User.swift
//  munchies
//
//  Created by Janet Olowe on 5/4/23.
//

import Foundation

struct User: Codable {
    var username: String
    var password: String
    var email: String

    init(username: String, password: String, email: String) {
        self.username = username
        self.password = password
        self.email = email
    }
}


struct UserResponse: Codable {
    var user: [User]
}

