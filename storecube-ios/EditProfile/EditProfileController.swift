//
//  EditProfileController.swift
//  storecube-ios
//
//  Created by Радмир Тельман on 11.07.2023.
//

import UIKit
import SnapKit

final class EditProfileController: UIViewController {
    
    // MARK: - UI
    
    private lazy var profileLabel: UILabel = {
        let label = UILabel()
        label.text = "Profile"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textAlignment = .center
        return label
    }()

    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        return textField
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "E-mail"
        return textField
    }()
    
    private lazy var phoneTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Phone"
        return textField
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save   ", for: .normal)
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
    
    // MARK: - setupViews
    
    private func setupViews() {
        [profileLabel, nameTextField, emailTextField, phoneTextField, saveButton ].forEach {
            view.addSubview($0)
        }
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        profileLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(93)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(profileLabel.snp.bottom).offset(60)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(45)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        phoneTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(45)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        saveButton.snp.makeConstraints { make in make.top.equalTo(phoneTextField.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(53)
        }
    }
}
