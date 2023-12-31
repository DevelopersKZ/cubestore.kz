//
//  SignInController.swift
//  storecube-ios
//
//  Created by Радмир Тельман on 04.07.2023.
//

import UIKit
import SnapKit

final class SignInController: UIViewController {
    
    // MARK: - UI
    
    private lazy var imageCarl: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.carlDance.uiImage
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "Montserrat-Medium", size: 35)
        label.numberOfLines = 0
        return label
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
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
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
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(AppColor.black.uiColor, for: .normal)
        button.backgroundColor = AppColor.aqua.uiColor
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 20)
        return button
    }()
    
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        let attributedText = NSAttributedString(string: "Forgot Password", attributes: underlineAttribute)
        button.setAttributedTitle(attributedText, for: .normal)
        button.setTitleColor(AppColor.aqua.uiColor, for: .normal)
        button.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 15)
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
        [imageCarl, signUpLabel, emailTextField, passwordTextField, signUpButton, forgotPasswordButton].forEach {
            view.addSubview($0)
        }
        view.backgroundColor = AppColor.silver.uiColor
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        imageCarl.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(158)
            make.trailing.leading.equalToSuperview()
        }
        signUpLabel.snp.makeConstraints { make in
            make.top.equalTo(imageCarl.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(145)
            make.trailing.equalToSuperview().offset(-144)
        }
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(signUpLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(34)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(52)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(14)
            make.leading.equalToSuperview().offset(34)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(52)
        }
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(34)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(52)
        }
        forgotPasswordButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(34)
            make.trailing.equalToSuperview().offset(-30)
            make.bottom.equalToSuperview().offset(-30)
        }
    }
    
    // MARK: - Actions
    
    @objc func registerHelpButtonDidPress() {
        let controller = SignUpController()
        controller.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
