//
//  ReviewOrderScreenViewModel.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 08/04/23.
//

import Foundation

class ReviewOrderScreenViewModel: ObservableObject {
    var numberOfItems: String {
        return CartManager.shared.allCartItems.count.description
    }
    
    var totalAmount: String {
        let totalAmount = CartManager.shared.allCartItems.reduce(0) { currentValue, product in
            return product.actualPrice + currentValue
        }
        return totalAmount.stringValue
    }
    
    var totalSavingOnPurchase: String {
        let totalSaving = CartManager.shared.allCartItems.reduce(0) { currentValue, product in
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
