//
//  SceneDelegate.swift
//  LorbyAuth
//
//  Created by anjella on 29/2/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let authorizationViewController = AuthorizationViewController(viewModel: AuthorizationViewModel())
        
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: authorizationViewController)
    }
}

