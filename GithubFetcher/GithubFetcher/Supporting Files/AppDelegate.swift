//
//  AppDelegate.swift
//  GithubFetcher
//
//  Created by Archeron on 24/05/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var coordinator: MainCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        UINavigationBar.appearance().tintColor = UIColor.black
        UINavigationBar.appearance().prefersLargeTitles = true

        let navController = UINavigationController()
        let coordinator = MainCoordinator(navigationController: navController)
        self.coordinator = coordinator
        coordinator.start()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()

        return true
    }
}

