//
//  MainCollectionViewCell.swift
//  CubeStore
//
//  Created by Ravil on 20.07.2023.
//

import UIKit
import SnapKit

final class MainCollectionViewCell: UICollectionViewCell {
    
    var buyButtonTappedHandler: (() -> Void)?

    static let reuseID = String(describing: MainCollectionViewCell.self)
    
    // MARK: - UI
    
    private lazy var cubeView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.aqua.uiColor
        view.layer.cornerRadius = 14
        return view
    }()
    
    private lazy var cubeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.cube.uiImage
        imageView.layer.cornerRadius = 14
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var cubeLabel: UILabel = {
        let label = UILabel()
        label.text = "ChinaCube"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "Montserrat-Regular", size: 17)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "7500 тг"
        label.textColor = .gray
        label.font = UIFont(name: "Montserrat-Regular", size: 10)
        return label
    }()
    
    private lazy var buyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Buy", for: .normal)
        button.setTitleColor(AppColor.black.uiColor, for: .normal)
        button.backgroundColor = AppColor.white.uiColor
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 12)
        button.addTarget(self, action: #selector(buyButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setupViews
    
    private func setupViews() {
        [cubeView, cubeImageView, cubeLabel, priceLabel, buyButton].forEach {
            contentView.addSubview($0)
        }
        contentView.backgroundColor = AppColor.silver.uiColor
    }
    
    // MARK: - setupCell
    
    private func setupCell() {
        self.backgroundColor = .clear
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        cubeView.snp.makeConstraints { make in
            make.width.equalTo(169)
            make.height.equalTo(191)
        }
        cubeImageView.snp.makeConstraints { make in
            make.top.equalTo(cubeView.snp.top).offset(11)
            make.leading.equalTo(cubeView.snp.leading).offset(16)
            make.trailing.equalTo(cubeView.snp.trailing).offset(-16)
            make.bottom.equalTo(cubeView.snp.bottom).offset(-73)
        }
        cubeLabel.snp.makeConstraints { make in
            make.top.equalTo(cubeImageView.snp.bottom).offset(3)
            make.centerX.equalTo(cubeView.snp.centerX)
        }
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(cubeLabel.snp.bottom).offset(3)
            make.centerX.equalTo(cubeLabel.snp.centerX)
        }
        buyButton.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(4)
            make.leading.equalTo(cubeView.snp.leading).offset(24)
            make.trailing.equalTo(cubeView.snp.trailing).offset(-24)
            make.bottom.equalTo(cubeView.snp.bottom).offset(-7)
        }
    }
    
    // MARK: - Actions
    
    @objc private func buyButtonTapped(_ sender: UIButton) {
        buyButtonTappedHandler?()
    }
}
