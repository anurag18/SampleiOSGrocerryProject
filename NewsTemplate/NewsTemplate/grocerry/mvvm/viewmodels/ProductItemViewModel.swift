//
//  ProductItemViewModel.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 08/04/23.
//

import Foundation

class ProductItemViewModel {
    private let product: ProductViewModel
    init(product: ProductViewModel) {
        self.product = product
    }
    
    
    var itemName: String {
        return product.productName
    }
    
    var itemCategory: String {
        return product.productCategory
    }
    
    var isAvailable: Bool {
        return product.isAvailable
    }
    var price: String {
        return self.product.actualPrice.stringValue
    }
    
    var discountedPrice: String {
        return product.discount.stringValue
    }
    
    func handleAddToCartAction(item: ProductViewModel) {
        CartManager.shared.addItemToTheCart(product: item)
    }
    
    func removeItemFromCartAction(item: ProductViewModel) -> Bool {
       return CartManager.shared.removeItemFromCart(product: item)
    }
}
