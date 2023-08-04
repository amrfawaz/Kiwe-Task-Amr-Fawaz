//
//  HomeInteractor.swift
//  Kiwe-Task
//
//  Created by Amr Fawaz on 03/08/2023.
//

import Foundation

protocol HomeInteracting {
    var presenterDelegate: HomePresenterDelegate? {set get}
    func getVenues(latitude: String, longitude: String)
}
protocol HomePresenterDelegate {
    func getVenuesSuccessfully(venues: [Venue])
    func getVenuesFaild()
}
class HomeInteractor: NSObject, HomeInteracting {
    
    var presenterDelegate: HomePresenterDelegate?
    private let provider: HomeProvider
    
    init(provider: HomeProvider) {
        self.provider = provider
    }

    func getVenues(latitude: String, longitude: String) {
        provider.getVenues(latitude: latitude, longitude: longitude, ofType: VenuesResponse.self) { [weak self] response in
            guard let venues = response?.response?.venues else {
                self?.presenterDelegate?.getVenuesFaild()
                return
            }
            self?.presenterDelegate?.getVenuesSuccessfully(venues: venues)
        }
    }
    
    
}


