//
//  ActionType.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 12/03/23.
//

import SwiftUI

protocol ActionType {
}

enum CardActionType: ActionType {
    case createOrder
    case manageOrder
    case trackOrder
    
    var actionName: String {
        switch self {
        case .createOrder:
            return "Create Order"
        case .manageOrder:
            return "Manage Order"
        case .trackOrder:
            return "Track Order"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .createOrder:
            return Color(.systemCyan)
        case .manageOrder:
            return Color(.systemCyan)
        case .trackOrder:
            return Color(.systemCyan)
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .createOrder:
            return Color.white
        case .manageOrder:
            return Color.white
        case .trackOrder:
            return Color.white
        }
    }
    
    var imageName: Image {
        switch self {
        case .createOrder:
            return Image(systemName: "paperplane.fill")
        case .manageOrder:
            return Image(systemName: "book")
        case .trackOrder:
            return Image(systemName: "sparkle.magnifyingglass")

        }
    }
}
