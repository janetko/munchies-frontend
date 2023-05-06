//
//  NetworkManager.swift
//  munchies
//
//  Created by Janet Olowe on 5/5/23.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    var host = URL(string: "http://34.85.222.240/api/")!
    
    func getAllRestaurants(completion: @escaping ([Restaurant]) -> Void) {
        var request = URLRequest(url: host)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, err in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(RestaurantResponse.self, from: data)
                    completion(response.restaurants)
                }
                catch (let error) {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
    
    func createReview(userID: Int, date: String, contents: String, rating: Int, completion: @escaping (Review) -> Void) {// image: ??
        let url = URL(string: "http://34.85.222.240/api/hall/{hall id}/reviews/")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = [
            "userID": userID,
            "date": date,
            "contents": contents,
            "rating": rating
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        let task = URLSession.shared.dataTask(with: request) {data, response, err in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(Review.self, from: data) // reviews issue
                    completion(response)
                }
                catch (let error) {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
        
    }
    
    func createUser(email: String, password: String, username: String, completion: @escaping (User) -> Void) {
        let url = URL(string: "http://34.85.222.240/api/signup/")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = [
            "email": email,
            "password": password,
            "username": username
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        let task = URLSession.shared.dataTask(with: request) {data, response, err in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(User.self, from: data)
                    completion(response)
                }
                catch (let error) {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
    
    func login(username: String, password: String, completion: @escaping (SessionToken?) -> Void) {
        let url = URL(string: "http://34.85.222.240/api/login/")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = [
            "username": username,
            "password": password
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(SessionToken.self, from: data)
                    completion(response)
                }
                catch (let error) {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
    
    
    
}
