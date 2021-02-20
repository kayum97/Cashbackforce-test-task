//
//  Router.swift
//  CASHBACKFORCE-test-task
//
//  Created by Admin on 20.02.2021.
//

import Foundation
import UIKit

protocol RouterProtocol {
    func showMainScreen()
    func showDetailScreen(albumItem: ResponseModel)
}

class Router: RouterProtocol {
    
    private let navigationController = UINavigationController()
    
    func showMainScreen() {
        guard let window = AppDelegate.shared.window else { return }
        
        let mainScreenViewController = MainScreenBuilder().createMainScreen(router: self)
        navigationController.viewControllers = [mainScreenViewController]
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func showDetailScreen(albumItem: ResponseModel) {
        let DetailedScreenViewController = DetailedScreenBuilder().createDetailedScreen(albumItem: albumItem)
        
        navigationController.pushViewController(DetailedScreenViewController, animated: true)
    }
}
