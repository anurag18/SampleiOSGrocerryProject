//
//  ManageOrder.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 12/03/23.
//

import SwiftUI

struct ManageOrderScreen: View {
    let manageOrderViewModel = ManageOrderViewModel()
    
    var body: some View {
        
        ContainerView {
            ScrollView(showsIndicators: false) {
                ForEach(manageOrderViewModel.orders){ order in
                    VStack {
                        HStack {
                            Text("#\(order.orderId)")
                                .font(.headline)
                                .foregroundStyle(.primary)
                                .foregroundColor(Color.blue)
                            Spacer()
                            Text(order.orderAmount)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        HStack {
                            Text(order.orderDate)
                                .font(.subheadline)
                                .foregroundStyle(.primary)
                            Spacer()
                            Text(order.savingOnOrder)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }.padding().background(Color.white)
                }
            }
        }.navigationTitle("Recent Orders")    }
    
}

struct ManageOrder_Previews: PreviewProvider {
    static var previews: some View {
        ManageOrderScreen()
    }
}
