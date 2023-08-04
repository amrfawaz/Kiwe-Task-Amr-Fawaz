//
//  ViewControllerFactory.swift
//  Kiwe-Task
//
//  Created by Amr Fawaz on 03/08/2023.
//

import Foundation
import Kingfisher

class ViewControllerFactory {

    func makeHomeVC(coordinator: HomeCoordinating) -> HomeViewController {
        HomeViewController(presenter: HomePresenter(interactor: HomeInteractor(provider: HomeProvider(provider: Provider())), coordinator: coordinator))
    }
}
