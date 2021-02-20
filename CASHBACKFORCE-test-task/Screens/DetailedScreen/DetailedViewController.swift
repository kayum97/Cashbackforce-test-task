//
//  DetailedViewController.swift
//  CASHBACKFORCE-test-task
//
//  Created by Admin on 20.02.2021.
//

import UIKit
import SnapKit
import Kingfisher

protocol DetailedViewProtocol: class {
    func setAlbumItem(_ albumItem: ResponseModel)
}

class DetailedViewController: UIViewController {
    var presenter: DetailedPresenterProtocol!
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    private let albumCover = UIImageView()
    
    private var urlButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        presenter.getAlbumItem()
        
        createUI()
        setupConstraints()
        
        urlButton.addTarget(self, action: #selector(tapOnTheUrlButton), for: .allTouchEvents)
    }
    
    @objc
    func tapOnTheUrlButton(sender: UIButton) {
        let pasteboard = UIPasteboard.general
        pasteboard.string = sender.title(for: .normal)
        self.showSimpleAlert(title: "Message", message: "link copied")
    }
    
    private func createUI() {
        view.addSubview(titleLabel)
        view.addSubview(albumCover)
        
        view.addSubview(urlButton)
        urlButton.setTitleColor(.black, for: .normal)
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.trailing.equalToSuperview().inset(15)
        }
        
        albumCover.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(200)
        }
        
        urlButton.snp.makeConstraints { (make) in
            make.top.equalTo(albumCover.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(15)
        }
    }
}

extension DetailedViewController: DetailedViewProtocol{
    func setAlbumItem(_ albumItem: ResponseModel) {
        titleLabel.text = albumItem.title
        
        let url = URL(string: albumItem.url)
        albumCover.kf.setImage(with: url, options: [.cacheOriginalImage])
        
        urlButton.setTitle(albumItem.url, for: .normal)
    }
}
