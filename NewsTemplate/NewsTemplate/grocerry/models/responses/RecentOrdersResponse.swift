//
//  Order.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 16/03/23.
//

import Foundation

enum ItemType:String, Codable {
    case grocerry,snack,food
}

enum CategoryType:String, Codable {
    case single, multiple
}

struct RecentOrdersResponse: Codable {
    let orders: [Order]
}

struct Order: Codable {
    let id:String
    let date: String
    let order_amount, saving: Double
    let category_type: CategoryType
    let item_type: [ItemType]
}
