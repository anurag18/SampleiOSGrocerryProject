//
//  UButton.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 15/03/23.
//

import SwiftUI

enum ButtonType {
    case primary, secondary
}

struct UButton: View {
    let title: String
    let buttonType: ButtonType

    var action:(()->())
    var isPrimaryButton: Bool {
        return self.buttonType == .primary
    }
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(isPrimaryButton ? Color.accentColor : Color.clear)
            Button(title) {
                self.action()
            }
            .foregroundColor(isPrimaryButton ? Color.white : Color.blue)
        }
        .border(Color.blue)
        //.cornerRadius(8)
        .frame(height: 50)

    }
}

struct UButton_Previews: PreviewProvider {
    static var previews: some View {
        UButton(title: "Button", buttonType: .secondary){
            
        }.previewLayout(.sizeThatFits)
    }
}
