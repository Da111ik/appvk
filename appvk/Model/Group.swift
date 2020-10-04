//
//  Group.swift
//  appvk
//
//  Created by Дарья Шимко on 01.10.2020.
//

import Foundation

// MARK: - GroupModel
struct GroupModel: Codable {
    let response: ResponseGroup
}

// MARK: - Response
struct ResponseGroup: Codable {
    let count: Int
    let items: [ItemGroup]
}

// MARK: - Item
struct ItemGroup: Codable {
    let id: Int
    let name, screenName: String
    let isClosed: Int
    let type: TypeEnumGroup
    let isAdmin, isMember, isAdvertiser: Int?
    let photo50, photo100, photo200: String
    let adminLevel: Int?

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
        case adminLevel = "admin_level"
    }
}

enum TypeEnumGroup: String, Codable {
    case event = "event"
    case group = "group"
    case page = "page"
}
