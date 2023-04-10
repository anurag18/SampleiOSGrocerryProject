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
    var height: CGFloat? = 50.0
    var borderColor: Color = Color.blue
    var backgroundColor: Color = Color.accentColor
    var action:(()->())
    var isPrimaryButton: Bool {
        return self.buttonType == .primary
    }
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(isPrimaryButton ? backgroundColor : Color.clear)
            Button(title) {
                self.action()
            }.padding(2)

            .foregroundColor(isPrimaryButton ? Color.white : Color.blue)
        }
        .border(borderColor)
        .frame(height: height)

    }
}

struct UButton_Previews: PreviewProvider {
    static var previews: some View {
        UButton(title: "Button", buttonType: .secondary){
            
        }.previewLayout(.sizeThatFits)
    }
}
