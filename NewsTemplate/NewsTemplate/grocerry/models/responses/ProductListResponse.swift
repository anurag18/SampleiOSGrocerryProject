//
//  Product.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 16/03/23.
//

import Foundation

struct ProductListResponse: Codable {
    let products: [Product]
}

struct Product: Codable {
    let name, category: String
    let price, discount_percentage: Double?
    let isAvailable: Bool?
}
