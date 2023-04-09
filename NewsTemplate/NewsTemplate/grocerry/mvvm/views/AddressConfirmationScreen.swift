//
//  AddressConfirmationView.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 12/03/23.
//

import SwiftUI

struct AddressConfirmationScreen: View {
    
    var body: some View {
        VStack {
            AddressConfirmationView()
            Spacer()
        }
    }
    
}

struct AddressConfirmationView: View {
    @State var shouldUpdateAddress =  false
    @State var shouldPlaceOrder =  false

    let background = ColorKit.sharedObject.background.mainBg
    let secondaryBackground = ColorKit.sharedObject.background.secondaryBg
    

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Delivery address")
                .font(.headline)
            ContainerView {
                    
                    Text("Flat no. 202, B wing Jd green Paradise , uttareshwar Road, 411047, lohegaon, Pune")
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(nil)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
            }
            Text("Mobile Number")
                .font(.headline)
            ContainerView {
                Text("+91 9818590812")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            VStack(alignment: .center) {
                UButton(title: "Update Address", buttonType: .secondary) {
                    self.shouldUpdateAddress.toggle()
                }
                
                UButton(title: "Place Order", buttonType: .primary) {
                    self.shouldPlaceOrder.toggle()
                }
            }
        }.padding()

        .navigationDestination(isPresented: $shouldUpdateAddress) {
            UpdateAddressScreen(flatNumber: "202", addressLine1: "JD Green Paradise B wing", landMark: "Jagadguru School", pincode: "411047")
        }
        .navigationDestination(isPresented: $shouldPlaceOrder) {
            ConfirmationScreen()
        }
        .navigationTitle("Confirm Address")
    }
}

struct AddressConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        AddressConfirmationScreen().previewLayout(.sizeThatFits)
    }
}
