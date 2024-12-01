//
//  NetworkManager.swift
//  Kryps
//
//  Created by Aaspreet Dhillon on 2024-11-30.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private init(){}
    
    let url = "https://jsonplaceholder.typicode.com/posts"
    
    func getPosts() async throws -> [Post] {
        
        guard let url = URL(string: url) else {throw fetchPostsError.invalidURL}
    
        let (data, _) = try await URLSession.shared.data(from: url)
       
        do{
            let decoder = JSONDecoder()
            return try decoder.decode([Post].self, from: data)
        }catch{
            print("Error decoding JSON: \(error)")
            throw fetchPostsError.invalidData
        }
    }
    
    
}
