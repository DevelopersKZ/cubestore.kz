//
//  SceneDelegate.swift
//  storecube-ios
//
//  Created by Ravil on 04.07.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
<<<<<<< HEAD
        let window = UIWindow(windowScene: windowScene)
        let windowShow = OnboardingController()
        let navigationController = UINavigationController(rootViewController: OnboardingController())
        window.rootViewController = navigationController
        
        self.window = window
        window.makeKeyAndVisible()
=======
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = MainViewController()
        window?.makeKeyAndVisible()
>>>>>>> 760b4cda81b4d8c43cad0ba4e5518d69d6f21b88
    }


    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

