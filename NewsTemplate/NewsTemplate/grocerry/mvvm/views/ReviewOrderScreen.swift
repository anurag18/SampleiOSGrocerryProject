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
    let reviewOrderViewModel: ReviewOrderScreenViewModel = ReviewOrderScreenViewModel()
    
    var body: some View {
        VStack {
            ContainerView {
                
                VStack(alignment: .leading, spacing: 18) {
                    HStack {
                        Text("Total Ordered Item").font(.headline)
                        Spacer()
                        Text(reviewOrderViewModel.numberOfItems).font(.caption).foregroundStyle(.secondary)
                    }
                    HStack {
                        Text("Payable Amount").font(.headline)
                        Spacer()
                        Text("\(reviewOrderViewModel.totalAmount) RS").font(.caption).foregroundStyle(.secondary)
                    }
                    HStack {
                        Text("Saving on purchase").font(.headline)
                        Spacer()
                        Text("\(reviewOrderViewModel.totalSavingOnPurchase) RS").font(.caption).foregroundStyle(.secondary)
                        
                    }
                }
                }.padding()
                
                Text("You have purchased below items kindly verify the details...")
                .font(.headline).padding()
                
                ScrollView(showsIndicators: false) {
                    ForEach(self.reviewOrderViewModel.cartItems) { item in
                        VStack {
                            HStack {
                                Text(item.productName)
                                Spacer()
                                Text(item.productCategory)
                            }
                            HStack {
                                Spacer()
                                Text(item.actualPrice.stringValue)
                            }
                        }.font(.caption).padding().background(Color.white)
                    }
                   
                }.padding()
                
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

struct ReviewOrder_Previews: PreviewProvider {
    static var previews: some View {
        Text("edit to unlock")
        // ReviewOrderScreen()
    }
}
