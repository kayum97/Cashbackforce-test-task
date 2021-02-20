//
//  Parser.swift
//  CASHBACKFORCE-test-task
//
//  Created by Admin on 20.02.2021.
//

import Foundation

class Parser {
    func parseFromJson(data: Data) -> [ResponseModel]? {
        do {
            let parsedResult = try JSONDecoder().decode([ResponseModel].self, from: data)
            return parsedResult
        } catch {
            return nil
        }
    }
}
