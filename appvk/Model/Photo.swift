//
//  Photo.swift
//  appvk
//
//  Created by Дарья Шимко on 01.10.2020.
//

import Foundation
import SwiftyJSON

// MARK: - PhotoJSON
struct PhotoJSON: Codable {
    
    let albumID, id, ownerID: Int
    let hasTags: Bool
    let sizes: [SizePhoto]
    let text: String
    let likes: LikesPhoto
    let reposts: RepostsPhoto
    let date: Date
    
    private var dateFormatter: DateFormatter = {
        
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        df.timeZone = TimeZone(secondsFromGMT: 0)
        
        return df
    }()
    
    init(from json: JSON) {
        
        self.id = json["id"].int!
        self.albumID = json["album_id"].int!
        self.ownerID = json["owner_id"].int!
        self.sizes = json["siezes"].arrayValue.map { SizePhoto(from: $0)}
        self.text = json["text"].stringValue
        self.hasTags = json["has_tags"].boolValue
        
        let dateDouble = json["date"].doubleValue
        self.date = Date(timeIntervalSince1970: dateDouble)
       
        self.likes = LikesPhoto(from: json["likes"])
        self.reposts = RepostsPhoto(from: json["reposts"])
        
    }
    
    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case date, id
        case ownerID = "owner_id"
        case hasTags = "has_tags"
        case sizes, text, likes, reposts
    }
}

// MARK: - Size
struct SizePhoto: Codable {
    let type: String
    let url: String
    let width, height: Int
    
    init(from json: JSON) {
        self.type = json["type"].stringValue
        self.url = json["url"].stringValue
        self.width = json["width"].int ?? 0
        self.height = json["height"].int ?? 0
    }
}

// MARK: - Likes
struct LikesPhoto: Codable {
    let userLikes, count: Int

    init(from json: JSON) {
        self.userLikes = json["user_likes"].int ?? 0
        self.count = json["count"].int ?? 0
    }

}

// MARK: - Reposts
struct RepostsPhoto: Codable {
    let count: Int
    
    init(from json: JSON) {
        self.count = json["count"].int ?? 0
    }
}
