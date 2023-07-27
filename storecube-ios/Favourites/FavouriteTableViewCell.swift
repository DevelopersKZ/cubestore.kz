//
//  FavouriteTableViewCell.swift
//  storecube-ios
//
//  Created by Радмир Тельман on 08.07.2023.
//

import UIKit
import SnapKit

final class FavouriteTableViewCell: UITableViewCell {
    
    // MARK: - UI
    
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.cube.uiImage
        return imageView
    }()
    
    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.text = "1 x"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
        
    private lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Yulong v2 M 3x3"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()

    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "10$"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    // MARK: - setupViews
    
    private func setupViews() {
        [productImageView, countLabel, productNameLabel, priceLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        productImageView.snp.makeConstraints{ make in
            make.size.equalTo(70)
            make.centerY.equalToSuperview()
            make.leading.equalTo(16)
        }
        
        countLabel.snp.makeConstraints { make in
            make.top.equalTo(35)
            make.leading.equalTo(productImageView.snp.trailing).offset(16)
        }
        
        productNameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(countLabel.snp.trailing).offset(20)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.leading.equalTo(100)
            make.top.equalTo(countLabel.snp.bottom).offset(18)
        }
        
    }
    
}
