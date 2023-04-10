//
//  ProductItemView.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 12/03/23.
//

import SwiftUI

struct MyStepper<Label: View>: View {
    @Binding var value: Int
    var `in`: ClosedRange<Int> // todo
    @ViewBuilder var label: Label
    
    var body: some View {
        HStack {
            label
                .font(.caption)
                .foregroundStyle(.secondary)
            Button("-") { value -= 1 }
            Text(value.formatted())
            Button("+") { value += 1 }
        }
        .buttonStyle(.plain)
    }
}

struct ProductItemView: View {
    private let productItemViewModel: ProductItemViewModel
    private let productViewModel: ProductViewModel
    private let cardbackground = ColorKit.sharedObject.background.secondaryBg
    @State private var addedInCart: Bool
    @State private var numberOfItem: Int = 1
    
    init(productViewModel: ProductViewModel) {
        self.productItemViewModel = ProductItemViewModel(product: productViewModel)
        self.productViewModel = productViewModel
        self.addedInCart = false
    }
    
    var body: some View {
        VStack {
            
            VStack{
                HStack {
                    Text(self.productItemViewModel.itemName)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Spacer()
                    MyStepper(value: $numberOfItem, in: 1...5) {
                        Text("Quantity")
                    }
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(self.productItemViewModel.price) at \(self.productItemViewModel.discountedPrice) %Off")
                            .font(.caption)
                        Text(self.productItemViewModel.isAvailable ? "Available" : "Unavailable")
                            .font(.subheadline)
                    }.foregroundStyle(.secondary)
                    Spacer()
                    UButton(title: !addedInCart ? "+ cart" : "- cart", buttonType: .primary, height: 30, backgroundColor: !addedInCart ? Color.blue : Color.orange) {
                        if !addedInCart {
                            self.addedInCart.toggle()
                            self.productItemViewModel.handleAddToCartAction(item: self.productViewModel)
                        } else {
                            if self.productItemViewModel.removeItemFromCartAction(item: self.productViewModel) {
                                self.addedInCart.toggle()
                            }
                        }
                    }.frame(width: 100)
                }
            }.padding()
        }.background(cardbackground)
    }
}
