//
//  OnboardingController.swift
//  storecube-ios
//
//  Created by Ravil on 13.07.2023.
//

import UIKit
import SnapKit

final class OnboardingController: UIViewController {

    // MARK: - UI
     
    private lazy var imageCube: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.cubeCarl.uiImage
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var welcomeView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var cubeStoreLabel: UILabel = {
        let label = UILabel()
        label.text = "CubeStore"
        label.textColor = AppColor.black.uiColor
        label.numberOfLines = 0
        label.font = UIFont(name: "Montserrat-Medium", size: 35)
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Rubik's Cube Store"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "Montserrat-SemiBold", size: 25)
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "The Rubik's Cube is a mechanical puzzle invented in 1974 by the Hungarian sculptor and architecture teacher Erno Rubik. The puzzle is a plastic cube with visible colored stickers."
        label.font = UIFont(name: "Montserrat-Light", size: 15)
        label.textColor = .gray
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get Started", for: .normal)
        button.setTitleColor(AppColor.black.uiColor, for: .normal)
        button.backgroundColor = AppColor.aqua.uiColor
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 20)
        button.addTarget(self, action: #selector(saveButtonDidPress), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        cornerRadius()
    }
    
    // MARK: - setupViews
    
    private func setupViews() {
        [imageCube, welcomeView, cubeStoreLabel].forEach {
            view.addSubview($0)
        }
        [titleLabel, subtitleLabel, continueButton].forEach {
            welcomeView.addSubview($0)
        }
        view.backgroundColor = AppColor.silver.uiColor
    }
    
    private func cornerRadius() {
        welcomeView.roundCorners(corners: [.topLeft, .topRight], radius: 60)
    }
    
    // MARK - setupConstraints
    
    private func setupConstraints() {
        imageCube.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(135)
            make.trailing.leading.equalToSuperview()
        }
        welcomeView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(505)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        cubeStoreLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(83)
            make.leading.equalToSuperview().offset(103)
            make.trailing.equalToSuperview().offset(-101)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(welcomeView).offset(32)
            make.leading.equalTo(welcomeView).offset(69)
            make.trailing.equalTo(welcomeView).offset(-69)
        }
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(31)
            make.leading.equalTo(welcomeView).offset(16)
            make.trailing.equalTo(welcomeView).offset(-16)
        }
        continueButton.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(30)
            make.leading.equalTo(welcomeView).offset(16)
            make.trailing.equalTo(welcomeView).offset(-16)
            make.height.equalTo(52)
        }
    }
    
    // MARK: - Actions
    
    @objc func saveButtonDidPress() {
        self.navigationController?.pushViewController(SignUpController(), animated: true)
    }
}
