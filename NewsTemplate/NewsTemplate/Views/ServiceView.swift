//
//  ServiceView.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 07/03/23.
//

import Foundation
import SwiftUI

struct ServiceView: View {
    let serviceName: String
    let services: [ServiceAction]
    let background: Color
  
    var body: some View {
        return ZStack {
            VStack {
                HStack {
                    Text("\(serviceName)")
                        .font(.headline)
                        .padding(4)
                    Spacer()
                    
                }
                Spacer()
                HStack {
                    Spacer()
                    ForEach (services, id: \.self) {
                        service in
                        VStack {
                            
                            CardView(type: service.actionType,
                                     onClick: service.performAction)
                            
                        }.padding(4)
                        .cornerRadius(8)
                    }
                }
                Spacer()
            }.padding(4)
        }
        .frame(height: 180)
        .background(background)
        .cornerRadius(8)
        .padding(4)
    }
    
    
}
