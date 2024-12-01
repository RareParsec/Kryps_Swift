//
//  PostModel.swift
//  Kryps
//
//  Created by Aaspreet Dhillon on 2024-11-30.
//

import Foundation

struct Post: Decodable, Identifiable {
    var id: Int
    var userId: Int
    var title: String
    var body: String
    var likes: Int? = 50
    var commentCount: Int? = 100
    var postDate: Date? = .init()
    
    enum CodingKeys: CodingKey {
        case id
        case userId
        case title
        case body
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.userId = try container.decode(Int.self, forKey: .userId)
        self.title = try container.decode(String.self, forKey: .title)
        self.body = try container.decode(String.self, forKey: .body)
    }
    
    init(id:Int,userId:Int,title:String,body:String){
        self.id = id
        self.userId = userId
        self.title = title
        self.body = body
    }
}

struct PostMockData {
    static var posts = [
                        Post(id: 101, userId: 101, title: "quaerat velit veniam amet cupiditate aut numquam ut sequi", body: "in non odio excepturi sint eum\nlabore voluptates vitae quia qui et\ninventore itaque rerum\nveniam non exercitationem delectus aut"),
                        Post(id: 102, userId: 102, title: "quaerat velit veniam amet cupiditate aut numquam ut sequi", body: "in non odio excepturi sint eum\nlabore voluptates vitae quia qui et\ninventore itaque rerum\nveniam non exercitationem delectus aut"),
                        Post(id: 103, userId: 103, title: "quaerat velit veniam amet cupiditate aut numquam ut sequi", body: "in non odio excepturi sint eum\nlabore voluptates vitae quia qui et\ninventore itaque rerum\nveniam non exercitationem delectus aut"),
                        Post(id: 104, userId: 104, title: "quaerat velit veniam amet cupiditate aut numquam ut sequi", body: "in non odio excepturi sint eum\nlabore voluptates vitae quia qui et\ninventore itaque rerum\nveniam non exercitationem delectus aut")]
    
    static var post = posts.first!
}
