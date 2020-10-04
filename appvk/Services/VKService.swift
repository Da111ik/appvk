//
//  NetworkService.swift
//  appvk
//
//  Created by Дарья Шимко on 01.10.2020.
//

import Foundation
import Alamofire

class VKService {
    
    public static var shared = VKService()
    
    static let session: Alamofire.Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 20
        let session = Alamofire.Session(configuration: configuration)
        return session
    }()
    
    
    // Получение списка друзей
    func loadFriends(token: String, callback: @escaping (UserModel) -> Void) {
        
        let baseUrl = "https://api.vk.com"
        let path = "/method/friends.get"
        
        let params: Parameters = [
            "access_token": token,
            "fields": "nickname,photo_200",
            "order": "name",
            "v": "5.124"
        ]
        
        VKService.session.request(baseUrl + path, method: .get, parameters: params).responseDecodable(of: UserModel.self) { response in
            
            switch response.result {
            
            case let .success(model) :
                callback(model)
            case let .failure(AFError) :
                debugPrint(AFError.localizedDescription)
            }
            
        }
    }
    
   
    // Получение фотографий человека
    func loadPhotos(token: String, ownerId: Int, callback: @escaping (PhotoModel) -> Void) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/photos.getAll"
        
        let params: Parameters = [
            "access_token": token,
            "owner_id": ownerId,
            "extended": 1,
            "v": "5.124"
        ]
        
        VKService.session.request(baseUrl + path, method: .get, parameters: params).responseDecodable(of: PhotoModel.self) { response in

            switch response.result {

            case let .success(model) :
                callback(model)
            case let .failure(AFError) :
                debugPrint(AFError.localizedDescription)
            }
            
            
        }
    }
    
    
    // Получение групп текущего пользователя
    func loadGroups(token: String, callback: @escaping (GroupModel) -> Void) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/groups.get"
        
        let params: Parameters = [
            "access_token": token,
            "extended": 1,
            "v": "5.124"
        ]
        
        VKService.session.request(baseUrl + path, method: .get, parameters: params).responseDecodable(of: GroupModel.self) { response in

            switch response.result {

            case let .success(model) :
                callback(model)
            case let .failure(AFError) :
                debugPrint(AFError.localizedDescription)
            }

        }
    }
    
    
    // Поиск групп
    func loadSearchGroups(token: String, query: String, callback: @escaping (GroupSearchModel) -> Void) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/groups.search"
        
        let params: Parameters = [
            "access_token": token,
            "q": query,
            "v": "5.124"
        ]
        
        VKService.session.request(baseUrl + path, method: .get, parameters: params).responseDecodable(of: GroupSearchModel.self) { response in
       
            switch response.result {
            
            case let .success(model) :
                callback(model)
            case let .failure(AFError) :
                debugPrint(AFError.localizedDescription)
            }
            
       
        }
    }
}
