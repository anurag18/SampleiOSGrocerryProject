//
//  UpdateAddress.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 13/03/23.
//

import SwiftUI

struct UpdateAddressScreen: View {
    @State var flatNumber: String
    @State var addressLine1: String
    @State var landMark: String
    @State var pincode: String
    let background = ColorKit.sharedObject.background.mainBg
    let secondaryBackground = ColorKit.sharedObject.background.secondaryBg
    
    
    var body: some View {
        ContainerView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Flat number")
                    .font(.headline)
                TextField("", text: $flatNumber)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .padding(16)
                    .border(Color.blue)
                
                Text("Address Line 1").font(.title2)
                TextField("", text: $addressLine1)
                    .foregroundStyle(.secondary)
                    .font(.headline)
                    .padding(16)
                    .border(Color.blue)
                
                Text("Landmark").font(.title2)
                TextField("", text: $landMark)
                    .foregroundStyle(.secondary)
                    .font(.subheadline)
                    .padding(16)
                    .border(Color.blue)
                Text("Pin code").font(.headline)
                TextField("", text: $pincode)
                    .foregroundStyle(.secondary)
                    .font(.subheadline)
                    .padding(16)
                    .border(Color.blue)
                Spacer()
                UButton(title: "Update") {
                    print("Order will be placed")
                }
            }
        }
        .navigationTitle("Update Address")
    }
}

struct UpdateAddress_Previews: PreviewProvider {
    static var previews: some View {
        UpdateAddressScreen(flatNumber: "102",addressLine1: "JD Green Paradise B wing",landMark: "Jagadguru School",pincode: "411047")
    }
}
