//
//  ChooseItem.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 12/03/23.
//

import SwiftUI

struct PurchaseScreen: View {
    @State var shouldCheckoutOrder: Bool = false
    
    var body: some View {
        ContainerView {
            ScrollView(showsIndicators: false) {
                SellableItem(itemName: "Lux", itemCategory: "Soap", isAvailable: false, discountedPrice: "30 RS", discountDescription: "5% Off on actual", addedInCart: false)
                SellableItem(itemName: "Lux", itemCategory: "Soap", isAvailable: false, discountedPrice: "30 RS", discountDescription: "5% Off on actual", addedInCart: false)
                SellableItem(itemName: "Lux", itemCategory: "Soap", isAvailable: false, discountedPrice: "30 RS", discountDescription: "5% Off on actual", addedInCart: false)
                SellableItem(itemName: "Lux", itemCategory: "Soap", isAvailable: false, discountedPrice: "30 RS", discountDescription: "5% Off on actual", addedInCart: false)
                SellableItem(itemName: "Lux", itemCategory: "Soap", isAvailable: false, discountedPrice: "30 RS", discountDescription: "5% Off on actual", addedInCart: false)
                SellableItem(itemName: "Lux", itemCategory: "Soap", isAvailable: false, discountedPrice: "30 RS", discountDescription: "5% Off on actual", addedInCart: false)
                SellableItem(itemName: "Lux", itemCategory: "Soap", isAvailable: false, discountedPrice: "30 RS", discountDescription: "5% Off on actual", addedInCart: false)
                SellableItem(itemName: "Lux", itemCategory: "Soap", isAvailable: false, discountedPrice: "30 RS", discountDescription: "5% Off on actual", addedInCart: false)
                
                UButton(title: "Checkout Cart") {
                    self.shouldCheckoutOrder.toggle()
                }
            }
        }
        .navigationTitle("Purchase Item")
        .navigationDestination(isPresented: $shouldCheckoutOrder) {
            AddressConfirmationScreen()
        }
    }
}

extension UINavigationController {
    // Remove back button text
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

struct ChooseItem_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseScreen()
    }
}
