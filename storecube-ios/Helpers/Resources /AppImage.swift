//
//  AppImage.swift
//  maki-maki-ios
//
//  Created by Ravil on 14.07.2023.
//

import UIKit

protocol AppImageProtocol {
    var rawValue: String { get }
}

extension AppImageProtocol {

    var uiImage: UIImage? {
        guard let image = UIImage(named: rawValue) else {
            fatalError("Could not find image with name \(rawValue)")
        }
        return image
    }
    
    var systemImage: UIImage? {
        guard let image = UIImage(systemName: rawValue) else {
            fatalError("Could not find image with name \(rawValue)")
        }
        return image
    }
    
}

enum AppImage: String, AppImageProtocol {
    
    // MARK: - AppImage
    
    case cube
    case cubeCarl
    case jimmyDog
    case coupon
    case carlDance
    case info
    case bannerCube
    case form
    
    // MARK: - TabBar
    
    case heart
    case home
    case search
    case shoppingbag
    case userTab
    
    // MARK: - Profile
    
    case profile
    case orders
    case user
    case like
    case offer
    case settings
    case about
    
    // MARK: - About
    
    case ravil
    case radmir
    
    // MARK: - LaunchScreen
    
    case rubikLaunchScreen
    
}
