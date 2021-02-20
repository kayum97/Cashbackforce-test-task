//
//  MainScreenBuilder.swift
//  CASHBACKFORCE-test-task
//
//  Created by Admin on 20.02.2021.
//

import Foundation
import UIKit

protocol MainScreenBuilderProtocol {
    func createMainScreen(router: RouterProtocol) -> UIViewController
}

class MainScreenBuilder: MainScreenBuilderProtocol {
    func createMainScreen(router: RouterProtocol) -> UIViewController {
        let mainViewController = MainViewController()
        let presenter = MainPresenter(view: mainViewController, router: router)
        mainViewController.presenter = presenter
        
        return mainViewController
    }
}

