//
//  RickyMortyTableViewCell.swift
//  RickAndMorty
//
//  Created by Talha on 16.10.2022.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftUI

class RickyMortyTableViewCell: UITableViewCell {
    private lazy var customImage: UIImageView = UIImageView()
    private lazy var title: UILabel = UILabel()
    private lazy var customDescription: UILabel = UILabel()
    private lazy var randomImage: String = "https://picsum.photos/200/300"
    
    enum Identifier: String {
        case custom = "page"
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        addSubview(customImage)
        addSubview(title)
        addSubview(customDescription)
        title.font = .boldSystemFont(ofSize: 18)
        customDescription.font = .italicSystemFont(ofSize: 10)
        
        customImage.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(contentView)
        }
        title.snp.makeConstraints { make in
            make.top.equalTo(customImage.snp.bottom).offset(10)
            make.right.left.equalTo(contentView)
           
        }
        customDescription.snp.makeConstraints { make in
            make.top.equalTo(title).offset(5)
            make.right.left.equalTo(title)
            make.bottom.equalToSuperview()
        }
    }
    func saveModel(model: Result) {
        title.text = model.name
        customDescription.text = model.status
        customImage.af.setImage(withURL: (URL(string: model.image ?? randomImage) ?? URL(string: randomImage)!))
    }
}
