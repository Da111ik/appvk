//
//  User.swift
//  appvk
//
//  Created by Дарья Шимко on 01.10.2020.
//

import UIKit
import SwiftyJSON

class User {
    
    let name: String
    let avaterImage: UIImage?
    let friends: [User]? = nil
    let group: [Group]? = nil
    
    init(_ name: String, _ avaterImage: UIImage) {
        
        self.name = name
        self.avaterImage = avaterImage
    }
}




// MARK: - Item
struct UserJSON: Codable {
    
    let id: Int
    let firstName, lastName: String
    var isClosed, canAccessClosed: Bool?
    let nickname: String?
    let photo200: String
    let online: Int
    let trackCode: String
    let deactivated: String?

    
    init(from json: JSON) {
    
        self.id                 = json["id"].int!
        self.firstName          = json["first_name"].stringValue
        self.lastName           = json["last_name"].stringValue
        self.isClosed           = json["is_closed"].boolValue
        self.canAccessClosed    = json["can_access_closed"].boolValue
        self.nickname           = json["nickname"].stringValue
        self.photo200           = json["photo_200"].stringValue
        self.online             = json["online"].int!
        self.trackCode          = json["track_code"].stringValue
        self.deactivated        = json["deactivated"].stringValue
        
    }
    
}
