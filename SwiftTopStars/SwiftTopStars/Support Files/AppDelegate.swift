//
//  AppDelegate.swift
//  SwiftTopStars
//
//  Created by Renan Trapp on 07/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let service = GitHubRepoService()
        
        let vm = TopRatedReposViewModel(service: service, navigationDelegate: self)
        let vc = TopRatedReposViewController(viewModel: vm)
        
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
        return true
    }
}


extension AppDelegate: TopRatedRepoNavigationProtocol {
    func goToDetails(of repo: Repository) {
    }
}
