//
//  SnackBarController.swift
//  CubeStore
//
//  Created by Ravil on 30.08.2023.
//

import Foundation
import SnackBar_swift

final class SnackBarController: SnackBar {

    override var style: SnackBarStyle {
        var style = SnackBarStyle()
        style.background = AppColor.aqua.uiColor
        style.textColor = AppColor.black.uiColor
        return style
    }

    static func showSnackBar(in view: UIView, message: String, duration: Duration) {
        let snackBar = SnackBarController.make(in: view, message: message, duration: duration)
        snackBar.show()
    }

}
