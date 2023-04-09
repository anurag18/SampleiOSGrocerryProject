//
//  OrderConfirmationScreen.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 13/03/23.
//

import SwiftUI

struct ConfirmationScreen: View {
    let innerPadding = 18.0
    let outerPadding = 16.0
    
    var orderConfirmationMessageView: some View {
        return VStack(alignment: .leading, spacing: 18) {
            HStack {
                Text("Thanks for your purchase")
                    .font(.headline)
                Spacer()
                
                Image(systemName: "checkmark.circle.fill").foregroundColor(Color.green)
            }
            Text("Our delivery partner will contact you shortly. Kindly do not pay money in advance. Pay on successful delivery of your items.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            Text("Invoice will be shared on your register email id after successful delivery of your order.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
    
    var addressView: some View {
        return VStack(alignment: .leading, spacing: 20) {
            
            
            Text("We will deliver at below address")                .font(.headline)
            
            Text("Flat no. 202, B wing Jd green Paradise , uttareshwar Road, 411047, lohegaon, Pune dfdaf a af af afa fafadf afa") .font(.subheadline)
            .foregroundStyle(.secondary)}
    }
    
    var trackingMessageView: some View {
        return VStack(alignment: .leading, spacing: 20) {
            Text("Track your order")
                .font(.headline)
            
            Text("You can track your order from track option present in homepage. ") .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
    var body: some View {
        VStack(alignment: .leading) {
            ContainerView {
                orderConfirmationMessageView
            }
            ContainerView {
                addressView
            }
            
            ContainerView {
                trackingMessageView
            }
            Spacer()
            
            UButton(title: "Ok", buttonType: .primary) {
                print("OK")
            }.padding()
        }
        .navigationTitle("Order Confirmed")
    }
}

struct OrderConfirmationScreen_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationScreen().previewLayout(.sizeThatFits)
    }
}
