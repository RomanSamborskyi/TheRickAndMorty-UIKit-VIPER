//
//  SceneDelegate.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 19.06.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        let tabBar = UITabBarController()
        
        let charactersViewController = UINavigationController(rootViewController: CharactersModulBuilder.build())
        let locationsViewController = UINavigationController(rootViewController: LocationsModulBuilder.build())
        let episodesViewController = UINavigationController(rootViewController: EpisodesModulBuilder.build())
        
        charactersViewController.tabBarItem = UITabBarItem(title: "Charackter", image: UIImage(systemName: "person"), tag: 0)
        locationsViewController.tabBarItem = UITabBarItem(title: "Locations", image: UIImage(systemName: "globe"), tag: 1)
        episodesViewController.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "tv"), tag: 2)
        
        let viewControllers = [charactersViewController, episodesViewController, locationsViewController]
        
        tabBar.viewControllers = viewControllers
        
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) { }

}

