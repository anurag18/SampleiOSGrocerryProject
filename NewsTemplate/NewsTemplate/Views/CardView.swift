//
//  CardView.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 07/03/23.
//

import SwiftUI


struct CardView: View {
    var imageName: String?
    let type: CardActionType
    
    var onClick: ((CardActionType)->())?
    
    var body: some View {
        VStack {
            CircleImageView(backgroundColor: type.backgroundColor, imageName: type.imageName, forgroundColor: type.foregroundColor)
            Text(self.type.actionName)
                .font(.caption)
                .lineLimit(nil)
                .foregroundColor(Color(.systemCyan))
        }.onTapGesture {
            onClick?(self.type)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardView( type: CardActionType.manageOrder).previewLayout(.sizeThatFits)
        }
    }
}
