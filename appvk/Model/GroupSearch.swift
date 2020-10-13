//
//  GroupSearch.swift
//  appvk
//
//  Created by Дарья Шимко on 04.10.2020.
//

import Foundation

// MARK: - GroupSearchModel
struct GroupSearchModel: Codable {
    let response: ResponseGroupSearch
}

// MARK: - Response
struct ResponseGroupSearch: Codable {
    let count: Int
    let items: [ItemGroupSearch]
}

// MARK: - Item
struct ItemGroupSearch: Codable {
    let id: Int
    let name, screenName: String
    let isClosed: Int
    let type: String
    let isAdmin, isMember, isAdvertiser: Int
    let photo50, photo100, photo200: String

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
