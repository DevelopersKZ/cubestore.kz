//
//  SearchTableViewCell.swift
//  CubeStore
//
//  Created by Радмир Тельман on 29.07.2023.
//

import UIKit
import SnapKit

class SearchTableViewCell: UITableViewCell {

    // MARK: - UI
    
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.newCube.uiImage
        return imageView
    }()
        
    private lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Yulong v2 M 3x3"
        label.font = UIFont(name: "Montserrat-Medium", size: 20)
        return label
    }()

    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "10$"
        label.font = UIFont(name: "Montserrat-Regular", size: 16)
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
        [productImageView, productNameLabel, priceLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        productImageView.snp.makeConstraints{ make in
            make.size.equalTo(65)
            make.centerY.equalToSuperview()
            make.leading.equalTo(20)
        }
        
        productNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.leading.equalTo(productImageView.snp.trailing).offset(20)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(65)
            make.leading.equalTo(productImageView.snp.trailing).offset(20)
        }
    }
}
