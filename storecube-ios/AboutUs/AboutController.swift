//
//  AboutController.swift
//  storecube-ios
//
//  Created by Радмир Тельман on 26.07.2023.
//

import UIKit
import SnapKit

final class AboutController: UIViewController {

    // MARK: - UI
    
    private lazy var ravilMainLabel: UILabel = {
        let label = UILabel()
        label.text = "Ravil Assimov"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "Montserrat-Bold", size: 36)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var ravilImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.ravil.uiImage
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var ravilLabel: UILabel = {
        let label = UILabel()
        label.text = "SnapKit\nAutoLayout\nUIKit\nSwift\nMVC\nMVP\nCoreData\nGit\nGitFlow\nNetworking"
        label.textColor = AppColor.gray.uiColor
        label.font = UIFont(name: "Montserrat-Regular", size: 18)
        label.numberOfLines = 0
        label.textAlignment = .right
        return label
    }()
    
    private lazy var radmirMainLabel: UILabel = {
        let label = UILabel()
        label.text = "Radmir Telman"
        label.textColor = .black
        label.font = UIFont(name: "Montserrat-Bold", size: 36)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var radmirImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.radmir.uiImage
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var radmirLabel: UILabel = {
        let label = UILabel()
        label.text = "SnapKit\nAutoLayout\nUIKit\nSwift\nGit\nGitFlow"
        label.textColor = AppColor.gray.uiColor
        label.font = UIFont(name: "Montserrat-Regular", size: 18)
        label.numberOfLines = 0
        label.textAlignment = .right
        return label
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    // MARK: - setupViews
    
    private func setupViews() {
        [ravilMainLabel, ravilImageView, ravilLabel, radmirImageView, radmirMainLabel, radmirLabel].forEach {
            view.addSubview($0)
        }
        view.backgroundColor = AppColor.silver.uiColor
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        ravilMainLabel.snp.makeConstraints() { make in
            make.top.equalToSuperview().offset(57)
            make.centerX.equalToSuperview()
        }
        
        ravilImageView.snp.makeConstraints() { make in
            make.top.equalTo(ravilMainLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-170)
        }
            
        ravilLabel.snp.makeConstraints() { make in
            make.top.equalTo(ravilMainLabel.snp.bottom).offset(50)
            make.leading.equalTo(ravilImageView.snp.trailing).offset(5)
            make.trailing.equalToSuperview().offset(-40)
        }
        
        radmirMainLabel.snp.makeConstraints(){ make in
            make.top.equalTo(ravilImageView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        
        radmirImageView.snp.makeConstraints(){ make in
            make.top.equalTo(radmirMainLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-160)
        }
        
        radmirLabel.snp.makeConstraints(){ make in
            make.top.equalTo(radmirMainLabel.snp.bottom).offset(70)
            make.leading.equalTo(radmirImageView.snp.trailing).offset(5)
            make.trailing.equalToSuperview().offset(-40)
        }
    }
}
