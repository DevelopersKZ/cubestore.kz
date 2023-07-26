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
    case cube
    case cubeCarl
    case jimmyDog
    case coupon
    case carlDance
    case info
    case bannerCube
}
