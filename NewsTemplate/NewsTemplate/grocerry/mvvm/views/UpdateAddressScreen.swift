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
        VStack {
        ContainerView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Flat number")
                    .font(.headline)
                TextField("", text: $flatNumber)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .padding(16)
                    .border(Color.blue).background(Color.white)
                
                Text("Address Line 1").font(.title2)
                TextField("", text: $addressLine1)
                    .foregroundStyle(.secondary)
                    .font(.headline)
                    .padding(16)
                    .border(Color.blue).background(Color.white)
                
                Text("Landmark").font(.title2)
                TextField("", text: $landMark)
                    .foregroundStyle(.secondary)
                    .font(.subheadline)
                    .padding(16)
                    .border(Color.blue).background(Color.white)
                Text("Pin code").font(.headline)
                TextField("", text: $pincode)
                    .foregroundStyle(.secondary)
                    .font(.subheadline)
                    .padding(16)
                    .border(Color.blue).background(Color.white)
            }
               
            }
            Spacer()
            UButton(title: "Update", buttonType: .primary) {
                print("Order will be placed")
            }.padding()
        }
        .navigationTitle("Update Address")
    }
}

struct UpdateAddress_Previews: PreviewProvider {
    static var previews: some View {
        UpdateAddressScreen(flatNumber: "102",addressLine1: "JD Green Paradise B wing",landMark: "Jagadguru School",pincode: "411047")
    }
}
