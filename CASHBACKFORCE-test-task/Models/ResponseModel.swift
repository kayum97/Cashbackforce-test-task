//
//  ResponseModel.swift
//  CASHBACKFORCE-test-task
//
//  Created by Admin on 20.02.2021.
//

import Foundation
import RealmSwift

struct ResponseModel: Codable {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}

final class ResponseModelRealm: Object {
    @objc dynamic var albumId: Int = 0
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var url: String = ""
    @objc dynamic var thumbnailUrl: String = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
