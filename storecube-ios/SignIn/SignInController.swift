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
    
    private lazy var signInLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign In"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "E-mail"
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        return textField
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(
            red: CGFloat(0x93) / 255.0,
            green: CGFloat(0xC2) / 255.0,
            blue: CGFloat(0xFD) / 255.0,
            alpha: 1.0
        )
        button.layer.cornerRadius = 14
        return button
    }()
    
    private lazy var createButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create Account", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(
            red: CGFloat(242) / 255.0,
            green: CGFloat(243) / 255.0,
            blue: CGFloat(245) / 255.0,
            alpha: 1.0
        )
        button.layer.cornerRadius = 14
        return button
    }()
    
    private lazy var forgotButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot password", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .clear
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
        view.addSubview(signInLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signInButton)
        view.addSubview(createButton)
        view.addSubview(forgotButton)
    }

    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        signInLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(93)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(signInLabel.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        passwordTextField.snp.makeConstraints{ make in
            make.top.equalTo(emailTextField.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        signInButton.snp.makeConstraints{ make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(100)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(53)
        }
        
        createButton.snp.makeConstraints{ make in
            make.top.equalTo(signInButton.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(53)
        }
        
        forgotButton.snp.makeConstraints{ make in
            make.top.equalTo(createButton.snp.bottom).offset(270)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
    
}
