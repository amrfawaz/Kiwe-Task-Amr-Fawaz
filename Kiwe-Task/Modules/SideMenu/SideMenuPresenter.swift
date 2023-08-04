//
//  SideMenuPresenter.swift
//  Kiwe-Task
//
//  Created by Amr Fawaz on 04/08/2023.
//

import Foundation
protocol SideMenuPresenting {
    var viewDelegate: SideMenuViewDelegate? {get set}
}
protocol SideMenuViewDelegate {
}
class SideMenuPresenter: SideMenuPresenting {
    var viewDelegate: SideMenuViewDelegate?


}

