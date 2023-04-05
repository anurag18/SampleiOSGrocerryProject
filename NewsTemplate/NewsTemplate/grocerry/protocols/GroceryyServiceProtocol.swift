//
//  GroceryyServiceProtocol.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 31/03/23.
//

import Foundation

protocol GrocerryProductServiceProtocol {
    func getProductList(completion:@escaping (ProductListResponse?, AppError?)->Void)
    
    //available for shopkeepers | admin
    func createProductList()
    func updateProductList()
    func updateProductItem()
}

protocol GrocerryOrderServiceProtocol {
    func retrieveRecentOrders(completion:@escaping (RecentOrdersResponse?, AppError?)->Void)
    func getOrderDetail(completion:@escaping (OrderDetailsResponse?, AppError?)->Void)
    func createOrder()
    func cancelOrder()
}

protocol GrocerryUserExtraServices {
    func retrieveCustomList(completion:@escaping (MyFavoritesResponse?, AppError?)->Void)
    func createCustomList()
}

protocol GrocerryTrackingService {
    func retrieveTrackingData(completion:@escaping (TrackingResponse?, AppError?)->Void)
}
