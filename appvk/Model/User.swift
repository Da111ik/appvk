//
//  User.swift
//  appvk
//
//  Created by Дарья Шимко on 01.10.2020.
//
import Foundation

// MARK: - UserModel
struct UserModel: Codable {
    let response: ResponseUser
}

// MARK: - Response
struct ResponseUser: Codable {
    let count: Int
    let items: [ItemUser]
}

// MARK: - Item
struct ItemUser: Codable {
    let id: Int
    let firstName, lastName: String
    let isClosed, canAccessClosed: Bool?
    let nickname: String?
    let photo200: String
    let online: Int
    let trackCode: String
    let deactivated: String?
    let lists: [Int]?

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case isClosed = "is_closed"
        case canAccessClosed = "can_access_closed"
        case nickname
        case photo200 = "photo_200"
        case online
        case trackCode = "track_code"
        case deactivated, lists
    }
}
