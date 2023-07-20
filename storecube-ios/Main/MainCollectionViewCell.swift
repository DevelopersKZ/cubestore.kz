//
//  MainCollectionViewCell.swift
//  CubeStore
//
//  Created by Ravil on 20.07.2023.
//

import UIKit

final class MainCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI
    
    private lazy var cubeView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.aqua.uiColor
        return view
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setupViews
    
    private func setupViews() {
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {

    }
    
}
