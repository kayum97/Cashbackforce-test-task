//
//  DataService.swift
//  CASHBACKFORCE-test-task
//
//  Created by Admin on 20.02.2021.
//

import Foundation
import RealmSwift

class DataService {
    func saveAlbums(albums: [ResponseModel], completion: @escaping (AppError?) -> Void) {
        DispatchQueue(label: "DataService.saveAlbums", qos: .background).async {
            
            let albums: [ResponseModelRealm] = albums.map { albumItem in
                let dataRealm = ResponseModelRealm()
                dataRealm.id = albumItem.id
                dataRealm.albumId = albumItem.albumId
                dataRealm.title = albumItem.title
                dataRealm.url = albumItem.url
                dataRealm.thumbnailUrl = albumItem.thumbnailUrl
                return dataRealm
            }
            
            guard let realm = try? Realm() else {
                completion(AppError.realmError)
                return
            }
            
            try? realm.write() {
                realm.add(albums, update: .modified)
            }
            
            completion(nil)
        }
    }
    
    func getAllAlbums(completion: @escaping ([ResponseModel]) -> Void) {
        let realm = try? Realm()
        let albums: [ResponseModel] = realm?.objects(ResponseModelRealm.self)
            .map {
                return ResponseModel(
                    albumId: $0.albumId, id: $0.id,
                    title: $0.title, url: $0.url,
                    thumbnailUrl: $0.thumbnailUrl
                )
            } ?? []
        
        completion(albums)
    }
}
