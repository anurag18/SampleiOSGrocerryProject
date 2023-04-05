//
//  UButton.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 15/03/23.
//

import SwiftUI

struct UButton: View {
    let title: String
    var action:(()->())
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(Color.accentColor)
            Button(title) {
                self.action()
            }
            .foregroundColor(Color.white)
        }
        .frame(height: 50)
        .cornerRadius(8)
    }
}

struct UButton_Previews: PreviewProvider {
    static var previews: some View {
        UButton(title: "Button"){
            
        }.previewLayout(.sizeThatFits)
    }
}
