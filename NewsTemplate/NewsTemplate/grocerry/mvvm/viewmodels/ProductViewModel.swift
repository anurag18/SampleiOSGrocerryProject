//
//  ProductViewModel.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 07/04/23.
//

import Foundation

class ProductViewModel: Identifiable {
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
    
    var actualPrice: String {
        return self.product.price?.stringValue ?? ""
    }
    
    var discount: String {
        return "\(self.product.discount_percentage?.stringValue ?? "") % OFF"
    }
}

