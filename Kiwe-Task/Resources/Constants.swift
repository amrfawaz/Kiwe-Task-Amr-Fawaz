//
//  Constants.swift
//  Kiwe-Task
//
//  Created by Amr Fawaz on 03/08/2023.
//

import Foundation


enum Endpoints {
    case venues
    var path: String {
        switch self {
        case .venues:
            return "/venues/search"
        }
    }
    
    var parameters: [String: String] {
        switch self {
        case .venues:
            return ["client_id": "4EQRZPSGKBZGFSERGJY055FRW2OSPJRZYR4C3J0JN2CQQFIV",
                    "client_secret": "AJR4B5LLRONWAJWJJOACHAFLCWS2YJAZMGQNFFZQP0IB3THR",
                    "v": "20230803"]
        }
    }
}
