//
//  Session.swift
//  appvk
//
//  Created by Дарья Шимко on 30.09.2020.
//

import Foundation

class Session {
    
    var token: String?
    var userId: Int?
    
    public static let shared = Session()
    
    private init() {
        
    }
}
