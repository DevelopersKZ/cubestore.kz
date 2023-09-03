//
//  ProductController.swift
//  CubeStore
//
//  Created by Радмир Тельман on 29.08.2023.
//

import UIKit
import SnapKit

final class ProductController: UIViewController {
    
    // MARK: - UI
    
    private lazy var cubeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.mainCube.uiImage
        imageView.layer.cornerRadius = 14
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var nameView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.aqua.uiColor
        view.layer.cornerRadius = 14
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "GAN251 V2"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "Montserrat-Medium", size: 18)
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "7500тг"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "Monserrat-Medium", size: 18)
        return label
    }()
    
    private lazy var favouriteButton: UIButton = {
        let button = UIButton(type: .system)
        let image = AppImage.like.uiImage
        button.setImage(image, for: .normal)
        button.backgroundColor = AppColor.aqua.uiColor
        button.layer.cornerRadius = 14
        return button
    }()
    
    private lazy var productView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.aqua.uiColor
        view.layer.cornerRadius = 12
        return view
    }()
    
    private lazy var productLabel: UILabel = {
        let label = UILabel()
        label.text = "Product detail"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "Montserrat-Regular", size: 18)
        return label
    }()
    
    private lazy var aboutView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.aqua.uiColor
        view.layer.cornerRadius = 14
        return view
    }()
    
    private lazy var nameBrandLabel: UILabel = {
        let label = UILabel()
        label.text = "Название бренда"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "Montserrat-Medium", size: 10)
        return label
    }()
    
    private lazy var nameTextBrandLabel: UILabel = {
        let label = UILabel()
        label.text = "GAN"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "Montserrat-Bold", size: 12)
        return label
    }()
    
    private lazy var modelLabel: UILabel = {
        let label = UILabel()
        label.text = "Номер модели"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "Montserrat-Medium", size: 10)
        return label
    }()
    
    private lazy var nameModelLabel: UILabel = {
        let label = UILabel()
        label.text = "Gan 251 V2"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "Montserrat-Bold", size: 12)
        return label
    }()
    
    private lazy var mestoLabel: UILabel = {
        let label = UILabel()
        label.text = "Произведено"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "Montserrat-Medium", size: 10)
        return label
    }()
    
    private lazy var nameMestoLabel: UILabel = {
        let label = UILabel()
        label.text = "Китай"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "Montserrat-Bold", size: 12)
        return label
    }()
    
    private lazy var materialLabel: UILabel = {
        let label = UILabel()
        label.text = "Материал"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "Montserrat-Medium", size: 10)
        return label
    }()
    
    private lazy var nameMaterialLabel: UILabel = {
        let label = UILabel()
        label.text = "Пластик"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "Montserrat-Bold", size: 12)
        return label
    }()
    
    private lazy var charView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.aqua.uiColor
        view.layer.cornerRadius = 14
        return view
    }()
    
    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.text = "Тип"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "Montserrat-Medium", size: 10)
        return label
    }()
    
    private lazy var nameTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "2x2"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "Montserrat-Bold", size: 12)
        return label
    }()
    
    private lazy var bruttoLabel: UILabel = {
        let label = UILabel()
        label.text = "Вес Брутто"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "Montserrat-Medium", size: 10)
        return label
    }()
    
    private lazy var nameBruttoLabel: UILabel = {
        let label = UILabel()
        label.text = "72г"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "Montserrat-Bold", size: 12)
        return label
    }()
    
    private lazy var weightLabel: UILabel = {
        let label = UILabel()
        label.text = "Размеры"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "Montserrat-Medium", size: 10)
        return label
    }()
    
    private lazy var nameWeightLabel: UILabel = {
        let label = UILabel()
        label.text = "51.0mm3"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "Montserrat-Bold", size: 12)
        return label
    }()
    
    private lazy var sizeLabel: UILabel = {
        let label = UILabel()
        label.text = "Вес"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "Montserrat-Medium", size: 10)
        return label
    }()
    
    private lazy var nameSizeLabel: UILabel = {
        let label = UILabel()
        label.text = "47,0 г"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "Montserrat-Bold", size: 12)
        return label
    }()
    
    private lazy var buyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Buy", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = AppColor.aqua.uiColor
        button.layer.cornerRadius = 14
        button.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 20)
        button.addTarget(self, action: #selector(buttonBuyTapped), for: .touchUpInside)
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
        [cubeImageView,nameView, favouriteButton, productView, aboutView, charView, buyButton, nameLabel, priceLabel, productLabel, nameBrandLabel, nameTextBrandLabel, modelLabel, nameModelLabel, mestoLabel, nameMestoLabel, materialLabel, nameMaterialLabel, typeLabel, nameTypeLabel, bruttoLabel, nameBruttoLabel, weightLabel, nameWeightLabel, sizeLabel, nameSizeLabel].forEach {
            view.addSubview($0)
        }
        view.backgroundColor = AppColor.silver.uiColor
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        cubeImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(110)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
        
        nameView.snp.makeConstraints { make in
            make.top.equalTo(cubeImageView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-120)
            make.height.equalTo(75)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(nameView.snp.top).offset(13)
            make.centerX.equalTo(nameView.snp.centerX)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.top).offset(25)
            make.centerX.equalTo(nameView.snp.centerX)
        }
    
        favouriteButton.snp.makeConstraints { make in
            make.top.equalTo(cubeImageView.snp.bottom).offset(20)
            make.leading.equalTo(nameView.snp.trailing).offset(20)
            make.trailing.equalToSuperview().offset(-30)
            make.width.equalTo(70)
            make.height.equalTo(75)
        }
        
        productView.snp.makeConstraints { make in
            make.top.equalTo(nameView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(30)
            make.width.equalTo(334)
            make.height.equalTo(40)
        }
        
        productLabel.snp.makeConstraints { make in
            make.center.equalTo(productView.snp.center)
        }
        
        aboutView.snp.makeConstraints { make in
            make.top.equalTo(productView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(30)
            make.width.equalTo(145)
            make.height.equalTo(160)
        }
        
        nameBrandLabel.snp.makeConstraints { make in
            make.top.equalTo(aboutView.snp.top).offset(10)
            make.centerX.equalTo(aboutView.snp.centerX)
        }
        
        nameTextBrandLabel.snp.makeConstraints { make in
            make.top.equalTo(nameBrandLabel.snp.top).offset(14)
            make.centerX.equalTo(aboutView.snp.centerX)
        }
        
        modelLabel.snp.makeConstraints { make in
            make.top.equalTo(nameTextBrandLabel.snp.top).offset(20)
            make.centerX.equalTo(aboutView.snp.centerX)
        }
        
        nameModelLabel.snp.makeConstraints { make in
            make.top.equalTo(modelLabel.snp.top).offset(14)
            make.centerX.equalTo(aboutView.snp.centerX)
        }
        
        mestoLabel.snp.makeConstraints { make in
            make.top.equalTo(nameModelLabel.snp.top).offset(20)
            make.centerX.equalTo(aboutView.snp.centerX)
        }
        
        nameMestoLabel.snp.makeConstraints { make in
            make.top.equalTo(mestoLabel.snp.top).offset(14)
            make.centerX.equalTo(aboutView.snp.centerX)
        }
        
        materialLabel.snp.makeConstraints { make in
            make.top.equalTo(nameMestoLabel.snp.top).offset(20)
            make.centerX.equalTo(aboutView.snp.centerX)
        }
        
        nameMaterialLabel.snp.makeConstraints { make in
            make.top.equalTo(materialLabel.snp.top).offset(14)
            make.centerX.equalTo(aboutView.snp.centerX)
        }
        
        charView.snp.makeConstraints { make in
            make.top.equalTo(productView.snp.bottom).offset(20)
            make.leading.equalTo(aboutView.snp.trailing).offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(160)
        }
        
        typeLabel.snp.makeConstraints { make in
            make.top.equalTo(charView.snp.top).offset(10)
            make.centerX.equalTo(charView.snp.centerX)
        }
        
        nameTypeLabel.snp.makeConstraints { make in
            make.top.equalTo(typeLabel.snp.top).offset(14)
            make.centerX.equalTo(charView.snp.centerX)
        }
        
        bruttoLabel.snp.makeConstraints { make in
            make.top.equalTo(nameTypeLabel.snp.top).offset(20)
            make.centerX.equalTo(charView.snp.centerX)
        }
        
        nameBruttoLabel.snp.makeConstraints { make in
            make.top.equalTo(bruttoLabel.snp.top).offset(14)
            make.centerX.equalTo(charView.snp.centerX)
        }
        
        weightLabel.snp.makeConstraints { make in
            make.top.equalTo(nameBruttoLabel.snp.top).offset(20)
            make.centerX.equalTo(charView.snp.centerX)
        }
        
        nameWeightLabel.snp.makeConstraints { make in
            make.top.equalTo(weightLabel.snp.top).offset(14)
            make.centerX.equalTo(charView.snp.centerX)
        }
        
        sizeLabel.snp.makeConstraints { make in
            make.top.equalTo(nameWeightLabel.snp.top).offset(20)
            make.centerX.equalTo(charView.snp.centerX)
        }
        
        nameSizeLabel.snp.makeConstraints { make in
            make.top.equalTo(sizeLabel.snp.top).offset(14)
            make.centerX.equalTo(charView.snp.centerX)
        }
        
        buyButton.snp.makeConstraints {make in
            make.top.equalTo(charView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(53)
        }
    }
    
    @objc private func buttonBuyTapped() {
        self.navigationController?.pushViewController(FormController(), animated: true)
    }
}
