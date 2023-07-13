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
        imageView.image = UIImage(named: "cubeCarl")
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
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 36)
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Rubik's Cube Store"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "The Rubik's Cube is a mechanical puzzle invented in 1974 by the Hungarian sculptor and architecture teacher Erno Rubik. The puzzle is a plastic cube with visible colored stickers."
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .gray
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get Started", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(
            red: CGFloat(0x93) / 255.0,
            green: CGFloat(0xC2) / 255.0,
            blue: CGFloat(0xFD) / 255.0,
            alpha: 1.0)
        button.layer.cornerRadius = 14
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        view.backgroundColor = .white
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
}
