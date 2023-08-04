//
//  HomeCoordinator.swift
//  Kiwe-Task
//
//  Created by Amr Fawaz on 03/08/2023.
//

import Foundation
import UIKit

protocol HomeCoordinating {
}
class HomeCoordinator: RootCoordinator, HomeCoordinating {
        
    override func start(shouldAnimateTransition: Bool, navigationType: NavigationType) {
        navigationController = UINavigationController(rootViewController: vcFactory.makeHomeVC(coordinator: self))
        window.rootViewController = navigationController
    }
}
