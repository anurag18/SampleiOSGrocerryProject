//
//  ContainerView.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 12/03/23.
//

import SwiftUI

struct ContainerView<Content: View>: View {
    @ViewBuilder var content: Content
    var background = ColorKit.sharedObject.background.mainBg
    let secondaryBackground = ColorKit.sharedObject.background.secondaryBg
    
    let padding = 8.0
    let mainScreen = UIScreen.main.scale
    var body: some View {
       return
        VStack(alignment: .leading) {
                    content
                        .padding()
                        .background(secondaryBackground)
                        .cornerRadius(20)
            }.padding()
            .background(background)
    }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView {
        }
}
}
