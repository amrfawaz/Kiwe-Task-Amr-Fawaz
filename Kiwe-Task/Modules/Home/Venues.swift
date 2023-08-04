//
//  Venues.swift
//  Kiwe-Task
//
//  Created by Amr Fawaz on 03/08/2023.
//

import Foundation

// MARK: - Venues Response
struct VenuesResponse: Codable {
    let meta: Meta?
    let response: Response?
}

// MARK: - Meta
struct Meta: Codable {
    let code: Int?
    let errorType, errorDetail, requestID: String?

    enum CodingKeys: String, CodingKey {
        case code, errorType, errorDetail
        case requestID = "requestId"
    }
}

// MARK: - Response
struct Response: Codable {
    let venues: [Venue]?
    let confident: Bool?
}


// MARK: - Venue
struct Venue: Codable {
    let id, name: String?
    let location: Location?
    let categories: [Category]?
    let createdAt: Int?
    let referralID: String?
    let hasPerk: Bool?

    enum CodingKeys: String, CodingKey {
        case id, name, location, categories, createdAt
        case referralID = "referralId"
        case hasPerk
    }
}

// MARK: - Category
struct Category: Codable {
    let id, name, pluralName, shortName: String?
    let icon: Icon?
    let primary: Bool?
}

// MARK: - Icon
struct Icon: Codable {
    let iconPrefix: String?
    let suffix: String?

    enum CodingKeys: String, CodingKey {
        case iconPrefix = "prefix"
        case suffix
    }
}

// MARK: - Location
struct Location: Codable {
    let address: String?
    let lat, lng: Double
    let distance: Int
    let postalCode: String?
    let city: String?
    let state: String?
    let country: String?
    let crossStreet: String?
    let formattedAddress: [String]?
}
