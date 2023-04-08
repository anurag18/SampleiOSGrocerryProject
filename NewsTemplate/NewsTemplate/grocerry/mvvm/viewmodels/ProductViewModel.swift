//
//  ProductViewModel.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 07/04/23.
//

import Foundation

class ProductViewModel: Identifiable,Equatable {
    static func == (lhs: ProductViewModel, rhs: ProductViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id =  UUID()
    let product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    var productName: String {
        return self.product.name
    }
    
    var productCategory: String {
        return self.product.category
    }
    
    var actualPrice: Double {
        return self.product.price ?? 0.0
    }
    
    var discount: Double {
        return self.product.discount_percentage ?? 0.0
    }
    
    var isAvailable: Bool {
        return self.product.isAvailable ?? false
    }
}

