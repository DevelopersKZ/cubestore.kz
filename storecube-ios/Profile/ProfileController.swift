//
//  ProfileController.swift
//  storecube-ios
//
//  Created by Радмир Тельман on 18.07.2023.
//

import UIKit
import SnapKit

class ProfileController: UIViewController {

    // MARK: - UI
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.profile.uiImage
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var profileMainLabel: UILabel = {
        let label = UILabel()
        label.text = "Radmir"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "Montserrat-Bold", size: 28)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var ordersButton: UIButton = {
        let button = UIButton(type: .system)
        let image = AppImage.orders.uiImage
        button.setImage(image, for: .normal)
        button.backgroundColor = AppColor.silver.uiColor
        button.layer.cornerRadius = 26
        button.layer.borderWidth = 2.0
        button.layer.borderColor = AppColor.lightGray.cgColor
        return button
    }()
    
    private lazy var profileButton: UIButton = {
        let button = UIButton(type: .system)
        let image = AppImage.user.uiImage
        button.setImage(image, for: .normal)
        button.backgroundColor = AppColor.silver.uiColor
        button.layer.cornerRadius = 26
        button.layer.borderWidth = 2.0
        button.layer.borderColor = AppColor.lightGray.cgColor
        return button
    }()
    
    private lazy var favouritesButton: UIButton = {
        let button = UIButton(type: .system)
        let image = AppImage.like.uiImage
        button.setImage(image, for: .normal)
        button.backgroundColor = AppColor.silver.uiColor
        button.layer.cornerRadius = 26
        button.layer.borderWidth = 2.0
        button.layer.borderColor = AppColor.lightGray.cgColor
        return button
    }()
    
    private lazy var offersButton: UIButton = {
        let button = UIButton(type: .system)
        let image = AppImage.offer.uiImage
        button.setImage(image, for: .normal)
        button.backgroundColor = AppColor.silver.uiColor
        button.layer.cornerRadius = 26
        button.layer.borderWidth = 2.0
        button.layer.borderColor = AppColor.lightGray.cgColor
        return button
    }()
    
    private lazy var settingsButton: UIButton = {
        let button = UIButton(type: .system)
        let image = AppImage.settings.uiImage
        button.setImage(image, for: .normal)
        button.backgroundColor = AppColor.silver.uiColor
        button.layer.cornerRadius = 26
        button.layer.borderWidth = 2.0
        button.layer.borderColor = AppColor.lightGray.cgColor
        return button    }()
    
    private lazy var aboutButton: UIButton = {
        let button = UIButton(type: .system)
        let image = AppImage.location.uiImage
        button.setImage(image, for: .normal)
        button.backgroundColor = AppColor.silver.uiColor
        button.layer.cornerRadius = 26
        button.layer.borderWidth = 2.0
        button.layer.borderColor = AppColor.lightGray.cgColor
        return button
    }()
    
    private lazy var ordersLabel: UILabel = {
        let label = UILabel()
        label.text = "Orders"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "Montserrat-Regular", size: 12)
        return label
    }()
    
    private lazy var profileLabel: UILabel = {
        let label = UILabel()
        label.text = "Profile"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "Montserrat-Regular", size: 12)
        return label
    }()
    
    private lazy var favouriteLabel: UILabel = {
        let label = UILabel()
        label.text = "Favourites"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "Montserrat-Regular", size: 12)
        return label
    }()
    
    private lazy var offersLabel: UILabel = {
        let label = UILabel()
        label.text = "Offers"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "Montserrat-Regular", size: 12)
        return label
    }()
    
    private lazy var settingsLabel: UILabel = {
        let label = UILabel()
        label.text = "Settings"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "Montserrat-Regular", size: 12)
        return label
    }()
    
    private lazy var aboutLabel: UILabel = {
        let label = UILabel()
        label.text = "About us"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "Montserrat-Regular", size: 12)
        return label
    }()
    
    private lazy var signOutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SIGN OUT", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = AppColor.aqua.uiColor
        button.layer.cornerRadius = 14
        button.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 20)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    // MARK: - setupViews
    
    private func setupViews() {
        [profileImageView, profileMainLabel, ordersButton, profileButton, favouritesButton, offersButton, settingsButton, aboutButton, ordersLabel, profileLabel, favouriteLabel, offersLabel, settingsLabel, aboutLabel, signOutButton].forEach {
            view.addSubview($0)
        }
        view.backgroundColor = AppColor.silver.uiColor
    }
    
    // MARK: - setupConstraints
    private func setupConstraints() {
        profileImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(83)
            make.leading.equalToSuperview().offset(111)
            make.trailing.equalToSuperview().offset(-111)
            make.centerX.equalToSuperview()
        }
        
        profileMainLabel.snp.makeConstraints() { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(40)
            make.centerX.equalTo(profileImageView.snp.centerX)
        }
        
        ordersButton.snp.makeConstraints() { make in
            make.top.equalTo(profileMainLabel.snp.bottom).offset(22)
            make.leading.equalToSuperview().offset(53)
            make.size.equalTo(70)
        }
        
        ordersLabel.snp.makeConstraints() { make in
            make.top.equalTo(ordersButton.snp.bottom).offset(5)
            make.centerX.equalTo(ordersButton.snp.centerX)
        }
        
        profileButton.snp.makeConstraints() { make in
            make.top.equalTo(profileMainLabel.snp.bottom).offset(22)
            make.centerX.equalToSuperview()
            make.size.equalTo(70)
        }
        
        profileLabel.snp.makeConstraints() {make in
            make.top.equalTo(profileButton.snp.bottom).offset(5)
            make.centerX.equalTo(profileButton.snp.centerX)
        }
        
        favouritesButton.snp.makeConstraints() { make in
            make.top.equalTo(profileMainLabel.snp.bottom).offset(22)
            make.trailing.equalToSuperview().offset(-53)
            make.size.equalTo(70)
        }
        
        favouriteLabel.snp.makeConstraints() { make in
            make.top.equalTo(favouritesButton.snp.bottom).offset(5)
            make.centerX.equalTo(favouritesButton.snp.centerX)
        }
        
        offersButton.snp.makeConstraints() { make in
            make.top.equalTo(ordersButton.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(50)
            make.size.equalTo(70)
        }
        
        offersLabel.snp.makeConstraints() { make in
            make.top.equalTo(offersButton.snp.bottom).offset(5)
            make.centerX.equalTo(offersButton.snp.centerX)
        }
        
        settingsButton.snp.makeConstraints() { make in
            make.top.equalTo(profileButton.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.size.equalTo(70)
        }
        
        settingsLabel.snp.makeConstraints() { make in
            make.top.equalTo(settingsButton.snp.bottom).offset(5)
            make.centerX.equalTo(settingsButton.snp.centerX)
        }
        
        aboutButton.snp.makeConstraints() { make in
            make.top.equalTo(favouritesButton.snp.bottom).offset(40)
            make.trailing.equalToSuperview().offset(-53)
            make.size.equalTo(70)
        }
        
        aboutLabel.snp.makeConstraints() { make in
            make.top.equalTo(aboutButton.snp.bottom).offset(5)
            make.centerX.equalTo(aboutButton.snp.centerX)
        }
        
        signOutButton.snp.makeConstraints() {make in
            make.top.equalTo(profileMainLabel.snp.bottom).offset(400)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(53)
        }
    }
}
