//
//  Restaurant.swift
//  munchies
//
//  Created by Janet Olowe on 4/30/23.
//


struct Restaurant: Codable {
    var name: String
    var image: String
    var rating: Float
    var hall_id: Int
    var reviews: [Review]
    
    init(name: String, eatPicName: String, rating: Float, hall_id: Int, reviews: [Review]) {
        self.name = name
        self.image = eatPicName
        self.rating = rating
        self.hall_id = hall_id
        self.reviews = reviews
    }
}

struct RestaurantResponse: Codable {
    var restaurants: [Restaurant]
}


