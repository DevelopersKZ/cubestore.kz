//
//  AppColor.swift
//  maki-maki-ios
//
//  Created by Ravil on 14.07.2023.
//

import UIKit

protocol AppColorProtocol {
    var rawValue: String { get }
}

extension AppColorProtocol {

    var uiColor: UIColor {
        guard let color = UIColor.init(named: rawValue) else {
            fatalError("Could not find color with name \(rawValue)")
        }
        return color
    }

    var cgColor: CGColor {
        return uiColor.cgColor
    }
}

enum AppColor: String, AppColorProtocol {
    case aqua
    case silver
    case black
    case white
    case lightGray
}
