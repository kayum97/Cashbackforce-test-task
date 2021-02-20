//
//  AppError.swift
//  CASHBACKFORCE-test-task
//
//  Created by Admin on 20.02.2021.
//

import Foundation

enum AppError: String, Error {
    case dataError = "Data acquisition error"
    case realmError = "Error local database."
}
