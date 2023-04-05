//
//  User.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 15/03/23.
//

import Foundation

enum UserType: String, Codable, CodingKey {
    case normal = "GEN001"
    case premium
}

struct LoginResponse: Codable {
    let user: User
    let services: [Service]
}

struct User: Codable {
    let name, surname: String
    let type: UserType
    let contact: Contact
}

struct Contact: Codable {
    let email, mobile: String
}

struct Service: Codable {
    let name, service_flag: String
    let enable: Bool
}
