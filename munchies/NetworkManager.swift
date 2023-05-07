//
//  NetworkManager.swift
//  munchies
//
//  Created by Janet Olowe on 5/5/23.
//

import Foundation
import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    
    var host = URL(string: "http://34.85.222.240/api/")!
    var authorization_token = ""
    
    func getAllRestaurants(completion: @escaping ([Restaurant]) -> Void) {
        var request = URLRequest(url: host)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, err in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(RestaurantResponse.self, from: data)
                    completion(response.restaurants)
                    print(response)
                }
                catch (let error) {
                    print(error.localizedDescription)
                    print(error)
                }
            }
           
        }
        task.resume()
        
    }
    
    func getRestaurant(hall_id: Int, completion: @escaping (Restaurant) -> Void) {
        let url = URL(string: "http://34.85.222.240/api/hall/" + String(hall_id) + "/")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, err in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(Restaurant.self, from: data)
                    completion(response)
                }
                catch (let error) {
                    print(error.localizedDescription)
                }
            }
           
        }
        task.resume()
        
    }
    
    func deleteReview(hall_id: Int, review_id: Int, completion: @escaping (Review) -> Void) {
        let url = URL(string: "http://34.85.222.240/api/hall/" + String(hall_id) + "/reviews/" + String(review_id) + "/")!
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.setValue(self.authorization_token, forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request) { data, response, err in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(Review.self, from: data)
                    completion(response)
                }
                catch (let error) {
                    print(error.localizedDescription)
                }
            }
           
        }
        task.resume()

    }
    
    
    
    func createReview(hall_id: Int, user_id: Int, contents: String, rating: Int, with_image: Bool, image_data: String, completion: @escaping (Review) -> Void) {
            let baseurl = "http://34.85.222.240/api/hall/"
            
            let url = URL(string: baseurl + String(hall_id) + "/reviews/")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue(self.authorization_token, forHTTPHeaderField: "Authorization")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let body: [String: Any] = [
                "user_id": user_id,
                "contents": contents,
                "with_image": with_image,
                "rating": rating,
                "image_data": image_data
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
                        print(error, "hi there")
                    }
                }
            }
            task.resume()
            
        }
        
        func createUser(email: String, password: String, username: String, completion: @escaping (User?) -> Void) {
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
                        guard let hope = response as? HTTPURLResponse else{
                            return
                        }
                        let headers = hope.allHeaderFields
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(User.self, from: data)
                        completion(response)
                        self.authorization_token = headers[AnyHashable("Authorization")] as! String
                    }
                    catch (let error) {
                        print(error.localizedDescription)
                        completion(nil)
                    }
                }
            }
            task.resume()
        }
        
        func login(email: String, password: String, completion: @escaping (User?) -> Void) {
            let url = URL(string: "http://34.85.222.240/api/login/")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let body: [String: Any] = [
                "email": email,
                "password": password
            ]
            
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let data = data {
                    do {
                        guard let hope = response as? HTTPURLResponse else{
                            return
                        }
                        let headers = hope.allHeaderFields
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(User.self, from: data)
                        completion(response)
                        self.authorization_token = headers[AnyHashable("Authorization")] as! String
                    }
                    catch (let error) {
                        print(error.localizedDescription)
                        completion(nil)
                    }
                }
            }
            task.resume()
        }
        
}
