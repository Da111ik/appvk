//
//  Group.swift
//  appvk
//
//  Created by Дарья Шимко on 01.10.2020.
//

import UIKit
import SwiftyJSON

class Group{
    
    let name: String
    let avatarImage: UIImage?
      
    init(_ name: String, _ avatarImage: UIImage?) {
        
        self.name = name
        self.avatarImage = avatarImage
        
    }
}

// MARK: - GroupJSON
struct GroupJSON: Codable {
    
    let id: Int
    let name, screenName: String
    let isClosed: Int
    let type: String
    let isAdmin, isMember, isAdvertiser: Int
    let photo50, photo100, photo200: String

    init(from json: JSON) {
        self.id = json["id"].int ?? 0
        self.name = json["name"].stringValue
        self.screenName = json["screen_name"].stringValue
        self.isClosed = json["is_closed"].int ?? 0
        self.type = json["type"].stringValue
        self.isAdmin = json["is_admin"].int ?? 0
        self.isMember = json["is_member"].int ?? 0
        self.isAdvertiser = json["is_advertiser"].int ?? 0
        self.photo50 = json["photo_50"].stringValue
        self.photo100 = json["photo_100"].stringValue
        self.photo200 = json["photo_200"].stringValue
        
        
    }
    enum CodingKeys: String, CodingKey {
        case id, name
        case screenName = "screen_name"
        case isClosed = "is_closed"
        case type
        case isAdmin = "is_admin"
        case isMember = "is_member"
        case isAdvertiser = "is_advertiser"
        case photo50 = "photo_50"
        case photo100 = "photo_100"
        case photo200 = "photo_200"
    }
}

