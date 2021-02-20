//
//  API.swift
//  CASHBACKFORCE-test-task
//
//  Created by Admin on 20.02.2021.
//

import Foundation
import Alamofire

class API {
    
    private let baseUrl = "https://jsonplaceholder.typicode.com/"
    private let endPointUrl = "photos"
    
    func loadData(completion: @escaping ([ResponseModel]?) -> Void) {
        guard let url = URL(string: baseUrl + endPointUrl) else {
            completion(nil)
            return
        }
        
        AF.request(url).response { response in
            if let data = response.data {
                let dataArray = Parser().parseFromJson(data: data)
                completion(dataArray)
            } else {
                completion(nil)
            }
        }
    }
}
