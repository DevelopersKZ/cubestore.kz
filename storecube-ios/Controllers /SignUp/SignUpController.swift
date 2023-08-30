//
//  SignUpController.swift
//  storecube-ios
//
//  Created by Ravil on 04.07.2023.
//

import UIKit
import SnapKit

final class SignUpController: UIViewController {

    // MARK: - UI
    
    private lazy var imageJimmy: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.jimmyDog.uiImage
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Registration"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "Montserrat-Medium", size: 35)
        label.numberOfLines = 0
        return label
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
        textField.autocapitalizationType = .none
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
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(AppColor.black.uiColor, for: .normal)
        button.backgroundColor = AppColor.aqua.uiColor
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 20)
        button.addTarget(self, action: #selector(buttonSignUpTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var loginKnowButton: UIButton = {
        let button = UIButton(type: .system)
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        let attributedText = NSAttributedString(string: "Have an account? Login", attributes: underlineAttribute)
        button.setAttributedTitle(attributedText, for: .normal)
        button.setTitleColor(AppColor.aqua.uiColor, for: .normal)
        button.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 15)
        button.addTarget(self, action: #selector(buttonSignUpTapped), for: .touchUpInside)
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
        [imageJimmy, signUpLabel, nameTextField, emailTextField, passwordTextField, signUpButton, loginKnowButton].forEach {
            view.addSubview($0)
        }
        view.backgroundColor = AppColor.silver.uiColor
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        imageJimmy.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(55)
            make.trailing.leading.equalToSuperview()
        }
        signUpLabel.snp.makeConstraints { make in
            make.top.equalTo(imageJimmy.snp.bottom).offset(11)
            make.leading.equalToSuperview().offset(86)
            make.trailing.equalToSuperview().offset(-84)
        }
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(signUpLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(34)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(52)
        }
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(14)
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
        loginKnowButton.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(34)
            make.trailing.equalToSuperview().offset(-30)
        }
    }
    
    // MARK: - Actions
    
    @objc private func buttonSignUpTapped() {
        var isValid = true
        
        if let name = nameTextField.text {
            if !validateName(name) {
                isValid = false
            }
        }
        
        if let email = emailTextField.text {
            if !validateEmail(email) {
                isValid = false
            }
        }
        
        if let password = passwordTextField.text {
            if !validatePassword(password) {
                isValid = false
            }
        }
        
        if isValid {
            navigateToMainScreen()
        }
    }

    private func validateName(_ name: String) -> Bool {
        if name.isEmpty {
            showSnackBar(message: "Please enter a name.")
            return false
        } else if name.count <= 3 {
            showSnackBar(message: "Name entered incorrectly.")
            return false
        }
        return true
    }
    
    private func validateEmail(_ email: String) -> Bool {
        if email.isEmpty {
            showSnackBar(message: "Please enter an email.")
            return false
        } else if email.count <= 3 {
            showSnackBar(message: "Email entered incorrectly.")
            return false
        }
        return true
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    private func validatePassword(_ password: String) -> Bool {
        if password.isEmpty {
            showSnackBar(message: "Please enter a password.")
            return false
        } else if password.count <= 6 {
            showSnackBar(message: "Password entered incorrectly.")
            return false
        }
        return true
    }
    
    private func navigateToMainScreen() {
        let controller = TabBarController()
        controller.navigationItem.hidesBackButton = true
        navigationController?.pushViewController(controller, animated: true)
    }
    
    // MARK: - SnackBar
    
    internal func showSnackBar(message: String) {
        if let view = self.view {
            SnackBarController.showSnackBar(in: view, message: message, duration: .lengthLong)
        }
    }
}
