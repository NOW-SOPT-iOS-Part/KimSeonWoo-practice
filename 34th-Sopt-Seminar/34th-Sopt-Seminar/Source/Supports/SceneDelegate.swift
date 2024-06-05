//
//  SceneDelegate.swift
//  34th-Sopt-Seminar
//
//  Created by Seonwoo Kim on 3/30/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
<<<<<<< HEAD
        let navigationController = UINavigationController(rootViewController: SignUpViewController())
=======
    // 3.
        let navigationController = UINavigationController(rootViewController: ChatViewController())
>>>>>>> origin/main
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}
