//
//  CircleImageView.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 12/03/23.
//

import SwiftUI

struct CircleImageView: View {
    var backgroundColor: Color?
    var offset: CGFloat?
    var imageName: Image?
    var forgroundColor: Color?
    @State private var shadowColor: Color = .gray
    @State private var shadowRadius: CGFloat = 2
    @State private var shadowX: CGFloat = 0
    @State private var shadowY: CGFloat = 2
    
    var body: some View {
        ZStack {
            Color.clear.opacity(0.1)
            Circle()
                .fill(backgroundColor ?? .white)
                
            imageName?
                .resizable()
                .foregroundColor(forgroundColor)
                .frame(width:34,
                       height:34,
                       alignment: .center)
        }
        .frame(width: 65,
               height:65)
        .clipped()
        .shadow(color: shadowColor,
                radius: shadowRadius,
                x: shadowX,
                y: shadowY)
    }
}


struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView()
    }
}
