//
//  AppDelegate.swift
//  MovieTrending
//
//  Created by Bruno Mazzocchi on 27/6/24.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Define window object to take all the frame of the main screen
        let window = UIWindow(frame: UIScreen.main.bounds)
        let navitationController = UINavigationController(rootViewController: MainViewController())
        window.rootViewController = navitationController
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}

