//
//  MainPresenter.swift
//  CASHBACKFORCE-test-task
//
//  Created by Admin on 20.02.2021.
//

import Foundation

protocol MainPresenterProtocol: class {
    func viewDidLoad()
    func tapOnTheAlbum(albumItem: ResponseModel)
}

class MainPresenter: MainPresenterProtocol {
    private weak var view: MainViewProtocol!
    private var router: RouterProtocol!
    private let service = API()
    private let dataService = DataService()
    
    init(view: MainViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func viewDidLoad() {
        service.loadData() { [weak self] resultLoadingData in
            guard let self = self else { return }
            guard let resultLoadingData = resultLoadingData else {
                self.view.showSimpleAlert(title: "Error", message: AppError.dataError.rawValue)
                self.getAllData()
                return
            }
            self.saveAlbums(albums: resultLoadingData)
            self.view.updateData(result: resultLoadingData)
        }
    }
    
    func tapOnTheAlbum(albumItem: ResponseModel) {
        self.router.showDetailScreen(albumItem: albumItem)
    }
    
    private func getAllData() {
        self.dataService.getAllAlbums() { [weak self] resultDataFromRealm in
            self?.view.updateData(result: resultDataFromRealm)
        }
    }
    
    private func saveAlbums(albums: [ResponseModel]) {
        dataService.saveAlbums(albums: albums) { [weak self] result in
            guard let result = result else {
                return
            }
            self?.view.showSimpleAlert(title: "Error", message: "\(result.rawValue)")
        }
    }
}
