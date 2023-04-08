//
//  ReviewOrderScreenViewModel.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 08/04/23.
//

import Foundation

class ReviewOrderScreenViewModel: ObservableObject {
    let products: [ProductViewModel]
    init(){
        self.products = CartManager.shared.allCartItems
    }
    
    var numberOfItems: String {
        return products.count.description
    }
    
    var totalAmount: String {
        let totalAmount = self.products.reduce(0) { currentValue, product in
            return product.actualPrice + currentValue
        }
        return totalAmount.stringValue
    }
    
    var totalSavingOnPurchase: String {
        let totalSaving = self.products.reduce(0) { currentValue, product in
            return self.calculateSaving(price: product.actualPrice, discount: product.discount) + currentValue
        }
        return totalSaving.stringValue
    }
    
    var cartItems: [ProductViewModel] {
        return CartManager.shared.allCartItems
    }
    
    private func calculateSaving(price: Double, discount: Double) -> Double {
        return price * discount / 100
    }
}
