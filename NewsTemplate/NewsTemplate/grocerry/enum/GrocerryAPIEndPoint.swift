//
//  LoginAPI.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 16/03/23.
//

import Foundation


enum GrocerryAPIEndPoint:APIEndPoint, CaseIterable {
    case login, productlist, recentOrders, orderDetails, myfavorites, trackOrder, createOrder, cancelOrder
   
    var methodType: MethodType {
        switch self {
        case .login, .productlist, .recentOrders,.orderDetails,.myfavorites,.trackOrder:
            return .GET
        case .createOrder, .cancelOrder:
            return .POST
        }
    }
    
    var path: String {
        switch self {
        case .login:
            return "login"
        case .productlist:
            return "productList"
        case .recentOrders:
            return "recentOrders"
        case .orderDetails:
            return "orderDetails"
        case .myfavorites:
            return "myfavorites"
        case .trackOrder:
            return "trackOrders"
        case .createOrder:
            return "createOrder"
        case .cancelOrder:
            return "canceOrder"
        }
    }
}
