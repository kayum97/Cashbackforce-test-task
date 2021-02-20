//
//  DetailedPresenter.swift
//  CASHBACKFORCE-test-task
//
//  Created by Admin on 20.02.2021.
//

import Foundation


protocol DetailedPresenterProtocol: class {
    func getAlbumItem()
}

class DetailedPresenter: DetailedPresenterProtocol {
    private weak var view: DetailedViewProtocol!
    private var albumItem: ResponseModel
    
    init(view: DetailedViewProtocol!, albumItem: ResponseModel) {
        self.view = view
        self.albumItem = albumItem
    }
    
    func getAlbumItem() {
        self.view?.setAlbumItem(albumItem)
    }
}
