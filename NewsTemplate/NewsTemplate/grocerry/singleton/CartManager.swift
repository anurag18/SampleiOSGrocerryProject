//
//  CartManager.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 08/04/23.
//

import Foundation

class CartManager {
    static let shared = CartManager()
    private var cartItems: [ProductViewModel]
    private init() {
        self.cartItems = [ProductViewModel]()
    }
    
    var allCartItems: [ProductViewModel] {
        return self.cartItems
    }
    
    func addItemToTheCart(product: ProductViewModel) {
        self.cartItems.append(product)
    }
    
    func removeItemFromCart(product: ProductViewModel) -> Bool {
        guard let index = self.cartItems.firstIndex(of: product) else { return false}
        self.cartItems.remove(at: index)
        return true
    }
}
