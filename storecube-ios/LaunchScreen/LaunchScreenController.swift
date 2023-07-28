//
//  LaunchScreenController.swift
//  CubeStore
//
//  Created by Ravil on 28.07.2023.
//

import UIKit
import SnapKit

final class LaunchScreenController: UIViewController {
    
    // MARK: - UI
    
    private lazy var rubikImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.rubikLaunchScreen.uiImage
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        performAnimation()
    }
    
    // MARK: - setupViews
    
    private func setupViews() {
        view.addSubview(rubikImageView)
        view.backgroundColor = AppColor.silver.uiColor
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        rubikImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(52)
            make.trailing.equalToSuperview().offset(-52)
            make.height.equalTo(270)
        }
    }
    
    // MARK: - perfomAnimation
    
    private func performAnimation() {
        UIView.animate(withDuration: 2.0, animations: {
            self.rubikImageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.rubikImageView.alpha = 0.0
        }) { (_) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                UIApplication.shared.windows.first?.rootViewController = TabBarController()
            }
        }
    }
}
