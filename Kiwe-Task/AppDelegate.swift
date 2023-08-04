//
//  AppDelegate.swift
//  Kiwe-Task
//
//  Created by Amr Fawaz on 03/08/2023.
//

import UIKit
import AlamofireNetworkActivityLogger

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        NetworkActivityLogger.shared.level = .debug
        NetworkActivityLogger.shared.startLogging()

        let vcFactory = ViewControllerFactory()
        let coordinatorFactory = CoordinatorFactory(vcFactory: vcFactory, window: window!)
        
        coordinatorFactory.makeHomeCoordinator().start(shouldAnimateTransition: true, navigationType: .window)
        setupNavigationBar()
        return true
    }
}

extension AppDelegate {
    private func setupNavigationBar() {
        if #available(iOS 15, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            let navigationBarTitleAttributes = [
                NSAttributedString.Key.foregroundColor : UIColor.white,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .medium)
            ]
            let navigationBarButtonsAttributes = [
                NSAttributedString.Key.foregroundColor : UIColor.white,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .medium)
            ]

            navigationBarAppearance.configureWithOpaqueBackground()
            navigationBarAppearance.titleTextAttributes = navigationBarTitleAttributes
            navigationBarAppearance.buttonAppearance.normal.titleTextAttributes = navigationBarButtonsAttributes
            navigationBarAppearance.doneButtonAppearance.normal.titleTextAttributes = navigationBarButtonsAttributes

            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().compactAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        }
    }
}
