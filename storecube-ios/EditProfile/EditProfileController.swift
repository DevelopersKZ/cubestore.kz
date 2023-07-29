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

    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.profile.uiImage
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.backgroundColor = AppColor.white.uiColor
        textField.borderStyle = .none
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 20
        textField.textColor = AppColor.black.uiColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.backgroundColor = AppColor.white.uiColor
        textField.borderStyle = .none
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 20
        textField.textColor = AppColor.black.uiColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var phoneTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Phone"
        textField.backgroundColor = AppColor.white.uiColor
        textField.borderStyle = .none
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 20
        textField.textColor = AppColor.black.uiColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
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
        [profileImageView, nameTextField, emailTextField, phoneTextField, saveButton].forEach {
            view.addSubview($0)
        }
        view.backgroundColor = AppColor.silver.uiColor
    }
    
    // MARK - setupConstraints
    
    private func setupConstraints() {
        profileImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.leading.equalToSuperview().offset(111)
            make.trailing.equalToSuperview().offset(-111)
            make.centerX.equalToSuperview()
        }
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(500)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(52)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(14)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(52)
        }
        
        phoneTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(14)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(52)
        }
        
        saveButton.snp.makeConstraints { make in make.top.equalTo(phoneTextField.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(53)
        }
    }
}
