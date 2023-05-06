//
//  SessionToken.swift
//  munchies
//
//  Created by Janet Olowe on 5/5/23.
//

import Foundation

struct SessionToken: Codable {
    let session_token: String
    let session_expiration: String
    let update_token: String
}
