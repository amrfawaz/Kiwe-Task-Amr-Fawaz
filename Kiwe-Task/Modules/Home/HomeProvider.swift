//
//  HomeProvider.swift
//  Kiwe-Task
//
//  Created by Amr Fawaz on 03/08/2023.
//

import Foundation
protocol HomeProviding {
    func getVenues<T: Decodable>(latitude: String, longitude: String, ofType: T.Type ,completion: @escaping (T?)->())
}

class HomeProvider: HomeProviding {
    private let provider: Provider
    private let api = rootUrl + apiVersion
    init(provider: Provider) {
        self.provider = provider
    }
    
    func getVenues<T>(latitude: String, longitude: String, ofType: T.Type, completion: @escaping (T?) -> ()) where T : Decodable {
        let headers = provider.buildHeaders(headerDictionary: [.accept: "application/json"])
        var params = Endpoints.venues.parameters
        params["ll"] = "\(longitude),\(latitude)"
        provider.getRequest(url: api + Endpoints.venues.path, T.self, ErrorModel.self, headers: headers, params: params, parameterEncoding: .queryString) { data, error  in
            completion(data)
        }
    }
}



