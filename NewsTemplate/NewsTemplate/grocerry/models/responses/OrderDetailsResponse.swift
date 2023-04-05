//
//  OrderDetails.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 16/03/23.
//

import Foundation

struct OrderDetailsResponse: Codable {
    let order: Order
    let items: [Product]
}
