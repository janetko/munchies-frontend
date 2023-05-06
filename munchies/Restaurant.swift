//
//  Restaurant.swift
//  munchies
//
//  Created by Janet Olowe on 4/30/23.
//


struct Restaurant: Codable {
    var name: String
    var eatPicName: String
    var rating: String
    var reviews: [Review]
    
    init(name: String, eatPicName: String, rating: String, reviews: [Review]) {
        self.name = name
        self.eatPicName = eatPicName
        self.rating = rating
        self.reviews = reviews
    }
}

struct RestaurantResponse: Codable {
    var restaurants: [Restaurant]
}


