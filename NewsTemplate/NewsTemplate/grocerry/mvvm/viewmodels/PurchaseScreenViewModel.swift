//
//  PurchaseScreenViewModel.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 07/04/23.
//

import Foundation

class PurchaseScreenViewModel: ObservableObject {

    @Published var products: [ProductViewModel]?
    @Published var cartItem: [Product] = []
    
    init() {
        self.fetchItemList()
    }
    
    func fetchItemList() {
        GrocerryApiService.shared.getProductList { response, error in
            if let response = response {
                self.products = response.products.map({ product in
                    ProductViewModel(product: product)
                })
            }
        }
    }
    
    func handleAddToCartAction(items: [SellableItem]) {
        
    }
    
    func handleCheckoutAction() {
        
    }
}
