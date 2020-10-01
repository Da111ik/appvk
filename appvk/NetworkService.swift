//
//  NetworkService.swift
//  appvk
//
//  Created by Дарья Шимко on 01.10.2020.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkService {
    
    public static var shared = NetworkService()
    
    static let session: Alamofire.Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 20
        let session = Alamofire.Session(configuration: configuration)
        return session
    }()
    
    
    // Получение списка друзей
    func loadFriends(token: String) {
        
        let baseUrl = "https://api.vk.com"
        let path = "/method/friends.get"
        
        let params: Parameters = [
            "access_token": token,
            "fields": "nickname,photo_200",
            "order": "name",
            "v": "5.122"
        ]
        
        NetworkService.session.request(baseUrl + path, method: .get, parameters: params).responseJSON { response in
            
            switch response.result {
            case .success(let data) :
                let json = JSON(data)
                let jsonFriends = json["response"]["items"].arrayValue
                let friends = jsonFriends.map { UserJSON(from: $0) }
                
                print(friends)
            case .failure(let error):
                print(error.localizedDescription)
                
            }
            
        }
    }
    
   
    // Получение фотографий человека
    func loadPhotos(token: String, ownerId: Int) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/photos.getAll"
        
        let params: Parameters = [
            "access_token": token,
            "owner_id": ownerId,
            "extended": 1,
            "v": "5.122"
        ]
        
        NetworkService.session.request(baseUrl + path, method: .get, parameters: params).responseJSON { response in
            
            switch response.result {
            case .success(let data) :
                let json = JSON(data)
                let photosJSON = json["response"]["items"].arrayValue
                let photos = photosJSON.map { PhotoJSON(from: $0) }
                
                print(photos)
            case .failure(let error):
                print(error.localizedDescription)
                
            }
            
            
        }
    }
    
    
    // Получение групп текущего пользователя
    func loadGroups(token: String) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/groups.get"
        
        let params: Parameters = [
            "access_token": token,
            "extended": 1,
            "v": "5.122"
        ]
        
        NetworkService.session.request(baseUrl + path, method: .get, parameters: params).responseJSON { response in
            switch response.result {
            case .success(let data) :
                let json = JSON(data)
                let groupJSON = json["response"]["items"].arrayValue
                let groups = groupJSON.map { GroupJSON(from: $0) }
                
                print(groups)
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }
    
    
    
    func loadSearchGroups(token: String, query: String) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/groups.search"
        
        let params: Parameters = [
            "access_token": token,
            "q": query,
            "v": "5.122"
        ]
        
        NetworkService.session.request(baseUrl + path, method: .get, parameters: params).responseJSON { response in
            switch response.result {
            case .success(let data) :
                let json = JSON(data)
                let groupJSON = json["response"]["items"].arrayValue
                let groups = groupJSON.map { GroupJSON(from: $0) }
                
                print(groups)
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }
}
