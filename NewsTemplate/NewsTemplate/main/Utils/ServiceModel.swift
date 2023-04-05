//
//  ServiceModel.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 12/03/23.
//

import Foundation
import SwiftUI

protocol Actionable: Hashable {
    var performAction:((ActionType)->())? { get }
}

struct ServiceAction {
    var actionType: CardActionType
    var performAction: ((ActionType) -> ())?
    
    init(actionType: CardActionType, performAction: ((ActionType) -> Void)? = nil) {
        self.actionType = actionType
        self.performAction = performAction
    }
}

extension ServiceAction: Actionable {
    static func == (lhs: ServiceAction, rhs: ServiceAction) -> Bool {
        return lhs.actionType == rhs.actionType
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.actionType)
    }
}
