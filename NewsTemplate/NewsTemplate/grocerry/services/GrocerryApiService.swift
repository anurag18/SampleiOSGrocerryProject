//
//  GrocerryApiService.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 29/03/23.
//

import Foundation

class GrocerryApiService {
    static let shared = GrocerryApiService()
    
    private var selectedEndPoint: APIEndPoint?
    private let baseURL: String = "https://grocerry.api.com"
    private init(selectedEndPoint: APIEndPoint? = nil) {
        self.selectedEndPoint = selectedEndPoint
    }
    
    private func isValid() -> Bool { guard let _ = self.endPoint as? GrocerryAPIEndPoint else { return false }
        return true
    }
    
}
extension GrocerryApiService: SessionManagerProtocol {
    var endPoint: APIEndPoint? {
        get { return selectedEndPoint }
        set { selectedEndPoint = newValue }
    }
    
    func makeApiRequest(completion:@escaping (AppNetworkResponse?, AppError?) -> Void) {
        if isValid(), let url = URL(string: baseURL+"/"+(endPoint?.path ?? "")) {
            self.activatedSession.initiateNetworkRequest(with: url) { response, error in
                completion(response,error)
            }
        } else { print("could not initiate call") }
    }
}

extension GrocerryApiService: GrocerryProductServiceProtocol {
    
    func getProductList(completion:@escaping (ProductListResponse?, AppError?)->Void) {
        self.endPoint = GrocerryAPIEndPoint.productlist
        self.makeApiRequest { response, error in
            guard let response = response, let productList: ProductListResponse = ResponseParser.parse(dictionary: response.response) else {
                completion(nil, error)
                return
            }
            DispatchQueue.main.async {
                completion(productList, nil)
            }
        }
    }
    
    func createProductList() { }
    func updateProductList() { }
    func updateProductItem() { }
    
}

extension GrocerryApiService: GrocerryOrderServiceProtocol {
    
    func getOrderDetail(completion:@escaping (OrderDetailsResponse?, AppError?)->Void) {
        self.endPoint = GrocerryAPIEndPoint.orderDetails
        
        self.makeApiRequest { response, error in
            guard let response = response, let orderDetail: OrderDetailsResponse = ResponseParser.parse(dictionary: response.response) else {
                completion(nil, error)
                return
            }
            completion(orderDetail, nil)
        }
    }
    
    func retrieveRecentOrders(completion:@escaping (RecentOrdersResponse?, AppError?)->Void) {
        self.endPoint = GrocerryAPIEndPoint.recentOrders
        
        self.makeApiRequest { response, error in
            guard let response = response, let recentOrders: RecentOrdersResponse = ResponseParser.parse(dictionary: response.response) else {
                completion(nil, error)
                return
            }
            completion(recentOrders, nil)
        }
    }
    
    func createOrder() { }
    func cancelOrder() { }
}

extension GrocerryApiService: GrocerryUserExtraServices {
    func retrieveCustomList(completion: @escaping (MyFavoritesResponse?, AppError?) -> Void) {
        self.endPoint = GrocerryAPIEndPoint.myfavorites
        
        self.makeApiRequest { response, error in
            guard let response = response, let favouriteList: MyFavoritesResponse = ResponseParser.parse(dictionary: response.response) else {
                completion(nil, error)
                return
            }
            completion(favouriteList, nil)
        }
    }
    
    func createCustomList() {
    }
}

extension GrocerryApiService: GrocerryTrackingService {
    func retrieveTrackingData(completion: @escaping (TrackingResponse?, AppError?) -> Void) {
        self.endPoint = GrocerryAPIEndPoint.trackOrder
        
        self.makeApiRequest { response, error in
            guard let response = response, let trackingData: TrackingResponse = ResponseParser.parse(dictionary: response.response) else {
                completion(nil, error)
                return
            }
            completion(trackingData, nil)
        }
    }
}
