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
    @State var reviewOrderViewModel: ReviewOrderScreenViewModel = ReviewOrderScreenViewModel()
    
    var summaryView: some View {
        return ContainerView {
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Order Summary").foregroundStyle(.primary).font(.headline)
                HStack {
                    Text("Total ordered item").font(.subheadline)
                    Spacer()
                    Text(self.reviewOrderViewModel.numberOfItems).font(.caption).foregroundStyle(.secondary)
                }
                HStack {
                    Text("Payable amount").font(.subheadline)
                    Spacer()
                    Text("\(self.reviewOrderViewModel.totalAmount) RS").font(.caption).foregroundStyle(.secondary)
                }
                HStack {
                    Text("Saving on purchase").font(.subheadline)
                    Spacer()
                    Text("\(self.reviewOrderViewModel.totalSavingOnPurchase) RS").font(.caption).foregroundStyle(.secondary)
                    
                }
            }
        }
    }
    
    var deliveryView: some View {
        ContainerView {
            HStack {
                VStack(alignment: .leading) {
                    Text("Delivery Address").foregroundStyle(.primary)
                    Text("JD Green Paradise B wing 202 uttareshwar road").foregroundStyle(.secondary)
                }
                .font(.headline)
            Spacer()
            }
        }
    }
    
    var itemsOnCartView: some View {
        return ContainerView {
            VStack(alignment: .leading) {
            Text("Review items")
                .font(.headline)
                .foregroundStyle(.primary)
                    HStack {
                        
                        Spacer()
                    }
                    ForEach(self.reviewOrderViewModel.cartItems) { item in
                        VStack {
                            HStack {
                                VStack {
                                    Text(item.productName)
                                    Text(item.productCategory)
                                        .foregroundStyle(.secondary)
                                }
                                HStack {
                                    Spacer()
                                    Text(item.actualPrice.stringValue)
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                                Button {
                                    print("Edit button was tapped")
                                } label: {
                                    Image(systemName: "delete.left.fill").foregroundColor(Color.blue)
                                }
                            }
                        }.font(.headline).padding(8)
                    }
                }
            }
    }
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                summaryView
                deliveryView
                itemsOnCartView
            }
            Spacer()
            UButton(title: "Next", buttonType: .primary) {
                self.shouldConfirmOrder.toggle()
            }
        }.padding()
        .navigationTitle("Confirm your purchase")
            .navigationDestination(isPresented: $shouldConfirmOrder) {
                AddressConfirmationScreen()
            }
    }
}

struct ReviewOrder_Previews: PreviewProvider {
    static var previews: some View {
        // Text("edit to unlock")
        ReviewOrderScreen()
    }
}
