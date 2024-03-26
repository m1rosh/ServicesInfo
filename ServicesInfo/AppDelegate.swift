//
//  AppDelegate.swift
//  ServicesInfo
//
//  Created by Сергей Мирошниченко on 25.03.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.backgroundColor = .white
        
        var rootViewController: UIViewController?
        rootViewController = ServicesViewController()
        
        guard let rootViewController else { return false }
        
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        let root = navigationController
        
        window?.rootViewController = root
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        
        return true
    }
}
