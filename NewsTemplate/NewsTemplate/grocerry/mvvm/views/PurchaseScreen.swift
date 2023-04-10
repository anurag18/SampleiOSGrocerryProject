//
//  ChooseItem.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 12/03/23.
//

import SwiftUI

struct PurchaseScreen: View {
    @State var shouldCheckoutOrder: Bool = false
    @ObservedObject var productList = PurchaseScreenViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            
            ContainerView {
                
                ScrollView(showsIndicators: false) {
                    Text("Select Product and quantity").font(.headline).foregroundStyle(.primary)
                    ForEach(productList.products ?? []) { product in
                        
                        ProductItemView(productViewModel: product)
                    }
                }
            }
            Spacer()
            UButton(title: "Checkout Cart", buttonType: .primary) {
                    self.shouldCheckoutOrder.toggle()
                }.padding(20)
            }
        .navigationTitle("Purchase Item")
        .navigationDestination(isPresented: $shouldCheckoutOrder) {
            ReviewOrderScreen()
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
