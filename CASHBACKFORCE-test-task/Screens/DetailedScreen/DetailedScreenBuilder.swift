//
//  DetailedScreenBuilder.swift
//  CASHBACKFORCE-test-task
//
//  Created by Admin on 20.02.2021.
//

import Foundation
import UIKit

protocol DetailedScreenBuilderProtocol {
    func createDetailedScreen(albumItem: ResponseModel) -> UIViewController
}

class DetailedScreenBuilder: DetailedScreenBuilderProtocol {
    func createDetailedScreen(albumItem: ResponseModel) -> UIViewController {
        let detailedViewController = DetailedViewController()
        let detailedScreenPresenter = DetailedPresenter(view: detailedViewController, albumItem: albumItem)
        detailedViewController.presenter = detailedScreenPresenter
        
        return detailedViewController
    }
}
