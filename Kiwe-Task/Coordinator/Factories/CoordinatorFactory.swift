//
//  CoordinatorFactory.swift
//  Kiwe-Task
//
//  Created by Amr Fawaz on 03/08/2023.
//

import UIKit

class CoordinatorFactory {
    
    private let vcFactory: ViewControllerFactory
    private let window: UIWindow
    init(vcFactory: ViewControllerFactory, window: UIWindow){
        self.vcFactory = vcFactory
        self.window = window
    }
    func makeHomeCoordinator()-> Coordinating {
        HomeCoordinator(window: window, viewFactory: vcFactory, coordinatorFactory: self)
    }
}
