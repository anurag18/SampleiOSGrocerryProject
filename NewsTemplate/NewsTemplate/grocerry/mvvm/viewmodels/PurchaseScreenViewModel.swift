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
    
    func handleAddToCartAction(item: ProductViewModel) {
        CartManager.shared.addItemToTheCart(product: item)
    }
    
    func removeItemFromCartAction(item: ProductViewModel) -> Bool {
       return CartManager.shared.removeItemFromCart(product: item)
    }
    
    func handleCheckoutAction() {
        
    }
}
