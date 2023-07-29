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
    
    private lazy var helpRegisterLabel: UILabel = {
        let label = UILabel()
        label.text = "Do you already have an account?"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "Montserrat-Regular", size: 20)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private lazy var helpRegisterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.setTitleColor(AppColor.aqua.uiColor, for: .normal)
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 15)
        button.titleLabel?.attributedText = NSAttributedString(string: "Register", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        button.addTarget(self, action: #selector(registerHelpButtonDidPress), for: .touchUpInside)
        return button
    }()
    
    private lazy var aboutButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.info.uiImage, for: .normal)
        button.addTarget(self, action: #selector(aboutButtonDidPress), for: .touchUpInside)
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
        [imageCarl, signUpLabel, emailTextField, passwordTextField, signUpButton, helpRegisterLabel, helpRegisterButton, aboutButton].forEach {
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
        helpRegisterLabel.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(38)
            make.leading.equalToSuperview().offset(35)
            make.trailing.equalToSuperview().offset(-33)
        }
        helpRegisterButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-145)
            make.bottom.equalToSuperview().offset(-30)
        }
        aboutButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(290)
            make.trailing.equalToSuperview().offset(-40)
            make.bottom.equalToSuperview().offset(-35)
            make.height.equalTo(52)
        }
    }
    
    // MARK: - Actions
    
    @objc func registerHelpButtonDidPress() {
        let controller = SignUpController()
        controller.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func aboutButtonDidPress() {
        self.navigationController?.pushViewController(AboutController(), animated: true)
    }
}
