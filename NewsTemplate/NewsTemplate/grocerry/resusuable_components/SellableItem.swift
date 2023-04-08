//
//  SellableItem.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 12/03/23.
//

import SwiftUI

struct SellableItem: View {
    private let sellableItemViewModel: SellableItemViewModel
    private let productViewModel: ProductViewModel
    private let cardbackground = ColorKit.sharedObject.background.secondaryBg
    @State private var addedInCart: Bool
    
    init(productViewModel: ProductViewModel) {
        self.sellableItemViewModel = SellableItemViewModel(product: productViewModel)
        self.productViewModel = productViewModel
        self.addedInCart = false
    }
    
    var body: some View {
        VStack {
            VStack{
                HStack {
                    VStack(alignment: .leading) {
                        Text(self.sellableItemViewModel.itemName)
                            .font(.headline)
                            .foregroundStyle(.primary)
                        Text(self.sellableItemViewModel.itemCategory)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text(self.sellableItemViewModel.isAvailable ? "Available" : "Unavailable")
                            .font(.subheadline)
                        Text("\(self.sellableItemViewModel.price) at \(self.sellableItemViewModel.discountedPrice) %Off")
                            .font(.caption)
                        
                    } .foregroundStyle(.secondary)
                }
                HStack {
                 Spacer()
                    Button(!addedInCart ? "Add to cart" : "Remove from cart") {
                        print("Item added in cart")
                        if !addedInCart {
                            self.addedInCart.toggle()
                            self.sellableItemViewModel.handleAddToCartAction(item: self.productViewModel)
                        } else {
                            if self.sellableItemViewModel.removeItemFromCartAction(item: self.productViewModel) {
                                self.addedInCart.toggle()
                            }
                        }
                    }
                }
            }.padding()
        }.background(cardbackground)
    }
}
