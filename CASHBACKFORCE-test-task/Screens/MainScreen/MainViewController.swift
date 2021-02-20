//
//  ViewController.swift
//  CASHBACKFORCE-test-task
//
//  Created by Admin on 20.02.2021.
//

import UIKit
import SnapKit

protocol MainViewProtocol: UIViewController {
    func updateData(result: [ResponseModel])
    func showSimpleAlert(title: String?, message: String?)
}

class MainViewController: UIViewController {
    var presenter: MainPresenterProtocol!
    
    private let tableView = UITableView()
    private var albums: [ResponseModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Albums"
        
        presenter.viewDidLoad()
        
        view.addSubview(tableView)
        configureTableView()
    }

    private func configureTableView() {
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifierForTableView)
        tableView.backgroundColor = .clear
        tableView.rowHeight = 90.0
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(5)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(10)
        }
    }

}

extension MainViewController: MainViewProtocol {
    func updateData(result: [ResponseModel]) {
        albums = result
        tableView.reloadData()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MainTableViewCell()
        
        cell.data = albums[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let albumItem = albums[indexPath.row]
        presenter.tappOnTheAlbum(albumItem: albumItem)
    }
}
