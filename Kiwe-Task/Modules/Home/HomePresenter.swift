//
//  HomePresenter.swift
//  Kiwe-Task
//
//  Created by Amr Fawaz on 03/08/2023.
//

import Foundation

protocol HomePresenting {
    var viewDelegate: HomeViewDelegate? {get set}
    var venues: [Venue]? { get }
    var latitude: Double? { get }
    var longitude: Double? { get }

    func getVenues()
    func getCurrentLocation()
    func numberOfVenues() -> Int
}
protocol HomeViewDelegate {
    func getVenuesSuccessfully()
    func getVenuesFaild(message: String)
}
class HomePresenter: HomePresenting {
    var coordinator: Coordinator
    typealias Coordinator = HomeCoordinating
    var viewDelegate: HomeViewDelegate?
    private var interactor: HomeInteracting
    var venues: [Venue]?
    var latitude: Double?
    var longitude: Double?
    lazy var locationService = LocationService()

    init(interactor: HomeInteracting, coordinator: Coordinator) {
        self.interactor = interactor
        self.coordinator = coordinator
        self.interactor.presenterDelegate = self
    }

    func getVenues() {
        if let latitude = latitude, let longitude = longitude {
            interactor.getVenues(latitude: "\(latitude)", longitude: "\(longitude)")
        }
    }
    
    func numberOfVenues() -> Int {
        venues?.count ?? 0
    }
    
    func getCurrentLocation() {
        locationService.getLocation { [weak self] location, error in
            guard let self = self else { return }
            self.latitude =  location?.latitude ?? 0
            self.longitude = location?.longitude ?? 0
            self.getVenues()
        }
    }
}

extension HomePresenter: HomePresenterDelegate {
    func getVenuesSuccessfully(venues: [Venue]) {
        self.venues = venues
        viewDelegate?.getVenuesSuccessfully()
    }
    
    func getVenuesFaild() {
        viewDelegate?.getVenuesFaild(message: "Something went wrong")
    }
}
