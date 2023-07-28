//
//  TabBarController.swift
//  CubeStore
//
//  Created by Ravil on 28.07.2023.
//

import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
    }
    
    // MARK: - setupTabBar
    
    private func setupTabBar() {
        viewControllers = [
            generateViewController(viewController: MainViewController(), title: "Home", image: AppImage.home.uiImage),
            generateViewController(viewController: FavouritesController(), title: "Favourite", image: AppImage.heart.uiImage),
            generateViewController(viewController: ProfileController(), title: "Profile", image: AppImage.userTab.uiImage),
            generateViewController(viewController: AboutController(), title: "About", image: AppImage.shoppingbag.uiImage)
        ]
    }
    
    private func generateViewController(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image?.withRenderingMode(.alwaysTemplate)
        viewController.tabBarItem.selectedImage = image?.withTintColor(.systemBlue)
        return viewController
    }
}
