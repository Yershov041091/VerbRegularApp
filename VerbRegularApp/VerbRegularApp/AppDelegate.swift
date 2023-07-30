//
//  AppDelegate.swift
//  VerbRegularApp
//
//  Created by Artem Yershov on 27.07.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window = window {
            let navigationControler = UINavigationController()
            navigationControler.viewControllers = [HomeViewController()]
            window.rootViewController = navigationControler
            window.makeKeyAndVisible()
        }
        
        return true
    }
}

