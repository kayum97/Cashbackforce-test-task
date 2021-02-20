//
//  MainTableViewCell.swift
//  CASHBACKFORCE-test-task
//
//  Created by Admin on 20.02.2021.
//

import UIKit
import SnapKit
import Kingfisher

class MainTableViewCell: UITableViewCell {
    static let identifierForTableView = "identifierForTableView"
    
    var data: ResponseModel? {
        didSet {
            title.text = data?.title
            let url = URL(string: data?.thumbnailUrl ?? "")
            albumCover.kf.setImage(with: url, options: [.cacheOriginalImage])
        }
    }
    
    private let title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    private let albumCover = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createUI() {
        contentView.addSubview(albumCover)
        contentView.addSubview(title)
    }
    
    private func setupConstraints() {
        albumCover.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview().inset(5)
            make.leading.equalToSuperview().inset(15)
            make.width.equalTo(80)
        }
        
        title.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(albumCover.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(15)
        }
    }
}
