//
//  ManageOrderViewModel.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 08/04/23.
//

import Foundation

class OrderViewModel: Identifiable {
    let id = UUID()
    let order: Order
    init(order: Order)
    {
        self.order = order
    }
    
    var orderId: String { self.order.id }
    var orderDate: String { self.order.date }
    var orderAmount: String { self.order.order_amount.stringValue }
    var savingOnOrder: String { self.order.saving.stringValue }
    var orderedItemType: [ItemType] { self.order.item_type }
    var isMultipleTypeOrder: Bool { self.order.category_type == .multiple }
    
}

class ManageOrderViewModel: ObservableObject {
    @Published var orders: [OrderViewModel] = []
    init() {
        self.fetchRecentOrders()
    }
    
    func fetchRecentOrders() {
        GrocerryApiService.shared.retrieveRecentOrders { response, error in
            if let recentOrderResponse = response {
                self.orders = recentOrderResponse.orders.map({ OrderViewModel(order: $0) })
            }
        }
    }
}
