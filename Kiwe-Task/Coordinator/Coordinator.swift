//
//  Coordinator.swift
//  Kiwe-Task
//
//  Created by Amr Fawaz on 03/08/2023.
//
import UIKit
import Foundation

enum NavigationType {
    case present, push, window
}
protocol Coordinating: AnyObject{
    var navigationController: UINavigationController? {get set}
    var childCoordinators: [Coordinating] {get set}
    var vcFactory: ViewControllerFactory {get set}
    var coordinatorFactory: CoordinatorFactory {get set}
    func start(shouldAnimateTransition: Bool, navigationType: NavigationType)
}

protocol CoordinatedScreen{
    associatedtype Coordinator
    var coordinator: Coordinator {get set}
}
