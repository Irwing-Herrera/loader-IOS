//
//  AppDelegate.swift
//  loader
//
//  Created by MacBook on 18/07/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Setup
        _setupView()
        
        return true
    }
    
    // MARK: - Private Methods
    
    private func _setupView() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController: UIViewController = HomeViewController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}

