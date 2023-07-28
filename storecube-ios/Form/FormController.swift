//
//  FormController.swift
//  CubeStore
//
//  Created by Радмир Тельман on 28.07.2023.
//

import UIKit
import SnapKit

final class FormController: UIViewController {

    // MARK: - UI
    
    private lazy var formImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.form.uiImage
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
    
    private lazy var commentTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Comment"
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
    
    private lazy var addressTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Address"
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
    
    private lazy var orderButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("ORDER", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = AppColor.aqua.uiColor
        button.layer.cornerRadius = 14
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
        [formImageView, nameTextField, phoneTextField, commentTextField, addressTextField, orderButton].forEach {
            view.addSubview($0)
        }
        view.backgroundColor = AppColor.silver.uiColor
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        formImageView.snp.makeConstraints(){ make in
            make.top.equalToSuperview().offset(80)
            make.centerX.equalToSuperview()
        }
        
        nameTextField.snp.makeConstraints(){ make in
            make.top.equalTo(formImageView.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(34)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(52)
        }
        
        phoneTextField.snp.makeConstraints(){ make in
            make.top.equalTo(nameTextField.snp.bottom).offset(25)
            make.leading.equalToSuperview().offset(34)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(52)
        }
        
        commentTextField.snp.makeConstraints() { make in
            make.top.equalTo(phoneTextField.snp.bottom).offset(25)
            make.leading.equalToSuperview().offset(34)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(52)
        }
        
        addressTextField.snp.makeConstraints() { make in
            make.top.equalTo(commentTextField.snp.bottom).offset(25)
            make.leading.equalToSuperview().offset(34)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(52)
        }
        
        orderButton.snp.makeConstraints() { make in
            make.top.equalTo(addressTextField.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(22)
            make.trailing.equalToSuperview().offset(-22)
            make.height.equalTo(53)
        }
    }
}
