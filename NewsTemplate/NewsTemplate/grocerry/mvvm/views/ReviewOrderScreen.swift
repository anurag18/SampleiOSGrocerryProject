//
//  ReviewOrder.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 13/03/23.
//

import SwiftUI

struct ReviewOrderScreen: View {
    @State var shouldConfirmOrder: Bool = false
    let background = ColorKit.sharedObject.background.mainBg
    let secondaryBackground = ColorKit.sharedObject.background.secondaryBg
    
    var body: some View {
        VStack {
            ContainerView {
                
                VStack(alignment: .leading, spacing: 18) {
                    HStack {
                        Text("Ordered Item").font(.headline)
                        Spacer()
                        Text("12").font(.caption).foregroundStyle(.secondary)
                    }
                    HStack {
                        Text("Total Amount").font(.headline)
                        Spacer()
                        Text("1204 RS").font(.caption).foregroundStyle(.secondary)
                    }
                    HStack {
                        Text("Saving Amount").font(.headline)
                        Spacer()
                        Text("120 RS").font(.caption).foregroundStyle(.secondary)
                        
                    }
                    Text("Please verify below purchase...")
                        .font(.subheadline).foregroundStyle(.secondary)
                }.padding()
                
                ScrollView(showsIndicators: false) {
                    
                    //                SellableItem(itemName: "Lux", itemCategory: "Soap", isAvailable: false, discountedPrice: "30 RS", discountDescription: "5% Off on actual", addedInCart: false)
                    //                SellableItem(itemName: "Honey", itemCategory: "Soap", isAvailable: false, discountedPrice: "30 RS", discountDescription: "5% Off on actual", addedInCart: false)
                    //                SellableItem(itemName: "Maggie", itemCategory: "Soap", isAvailable: false, discountedPrice: "30 RS", discountDescription: "5% Off on actual", addedInCart: false)
                    //                SellableItem(itemName: "Biscuite", itemCategory: "Soap", isAvailable: false, discountedPrice: "30 RS", discountDescription: "5% Off on actual", addedInCart: false)
                    //                SellableItem(itemName: "Pasta", itemCategory: "Soap", isAvailable: false, discountedPrice: "30 RS", discountDescription: "5% Off on actual", addedInCart: false)
                    //                SellableItem(itemName: "Pizza", itemCategory: "Soap", isAvailable: false, discountedPrice: "30 RS", discountDescription: "5% Off on actual", addedInCart: false)
                    //                SellableItem(itemName: "lolly pop", itemCategory: "Soap", isAvailable: false, discountedPrice: "30 RS", discountDescription: "5% Off on actual", addedInCart: false)
                    //                SellableItem(itemName: "Achar", itemCategory: "Soap", isAvailable: false, discountedPrice: "30 RS", discountDescription: "5% Off on actual", addedInCart: false)
                   
                }
                
                .navigationTitle("Confirm your purchase")
                .navigationDestination(isPresented: $shouldConfirmOrder) {
                    ConfirmationScreen()
                }
            }
            Spacer()
            UButton(title: "Confirm") {
                self.shouldConfirmOrder.toggle()
            }.padding(20)
        }
    }
}

struct ReviewOrder_Previews: PreviewProvider {
    static var previews: some View {
        ReviewOrderScreen()
    }
}
