//
//  SellableItem.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 12/03/23.
//

import SwiftUI

struct SellableItem: View {
    let itemName: String
    let itemCategory: String
    let isAvailable: Bool
    let discountedPrice: String
    let discountDescription: String
    let addedInCart: Bool
    
    let cardbackground = ColorKit.sharedObject.background.secondaryBg
    
    var body: some View {
        VStack {
            VStack{
                HStack {
                    VStack(alignment: .leading) {
                        Text(itemName)
                            .font(.headline)
                            .foregroundStyle(.primary)
                        Text(itemCategory)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text(isAvailable ? "Available" : "Unavailable")
                            .font(.subheadline)
                        Text("\(discountedPrice)")
                            .font(.subheadline)
                        Text("\(discountDescription)")
                            .font(.subheadline)
                    } .foregroundStyle(.secondary)
                }
                HStack {
                 Spacer()
                    Button(!addedInCart ? "Add to cart" : "Remove from cart") {
                        print("Item added in cart")
                    }
                }
            }.padding()
        }.background(cardbackground)
    }
}

struct SellableItem_Previews: PreviewProvider {
    static var previews: some View {
        SellableItem(itemName: "Lux",
                     itemCategory: "Soap", isAvailable: false, discountedPrice: "30 RS", discountDescription: "5% Off on actual",
                     addedInCart:false).previewLayout(.sizeThatFits)
    }
}
