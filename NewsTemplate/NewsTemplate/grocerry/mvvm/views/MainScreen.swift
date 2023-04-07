//
//  TabView.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 07/03/23.
//

import Foundation
import SwiftUI

struct TabularView: View {
    let background = ColorKit.sharedObject.background.mainBg
    let cardbackground = ColorKit.sharedObject.background.secondaryBg
    
    @State private var shouldShowTrackOrderView = false
    @State private var shouldShowManageOrderView = false
    @State private var shouldShowCreateOrderView = false

    func navigationAction(type: ActionType) -> () {
        guard let type = type as? CardActionType else {
            return
        }
        switch type {
        case .trackOrder:
            shouldShowTrackOrderView.toggle()

        case .manageOrder:
            shouldShowManageOrderView.toggle()

        case .createOrder:
            shouldShowCreateOrderView.toggle()
            
        }
    }
    
    fileprivate func grocerryServiceView() -> ServiceView {
        return ServiceView(serviceName: "Grocerry services near by you",
                           services: [
                            ServiceAction(actionType: .createOrder, performAction: self.navigationAction(type:)),
                            ServiceAction(actionType: .manageOrder, performAction: self.navigationAction(type:)),
                            ServiceAction(actionType: .trackOrder, performAction: self.navigationAction(type:))
                           ],
                           background: cardbackground)
    }
    
    fileprivate func milkServiceView() -> ServiceView {
        return ServiceView(serviceName: "Milk Services near by you",
                           services: [
                            ServiceAction(actionType: .createOrder, performAction: self.navigationAction(type:)),
                            ServiceAction(actionType: .manageOrder, performAction: self.navigationAction(type:)),
                            ServiceAction(actionType: .trackOrder, performAction: self.navigationAction(type:))
                           ],
                           background: cardbackground)
    }

    fileprivate func vehicleServiceView() -> ServiceView {
        return ServiceView(serviceName: "Find nearby vehicle services",
                           services: [
                            ServiceAction(actionType: .createOrder, performAction: self.navigationAction(type:)),
                            ServiceAction(actionType: .manageOrder, performAction: self.navigationAction(type:)),
                            ServiceAction(actionType: .trackOrder, performAction: self.navigationAction(type:))
                           ],
                           background: cardbackground)
    }
    var homeView: some View {
        NavigationView {
            ContainerView {
                    grocerryServiceView()
            }
            .navigationBarTitle("Anurag Sharma")
        }
      .navigationDestination(isPresented: $shouldShowCreateOrderView) {
          PurchaseScreen()
        }
        
        .navigationDestination(isPresented: $shouldShowTrackOrderView) {
            AddressConfirmationScreen()
        }
        .navigationDestination(isPresented: $shouldShowManageOrderView) {
            ManageOrderScreen()
        }

        
    }
    
    var settingView: some View {
        VStack {

            Text("Setting")
             
        }
    }
    
    var body: some View {
        return TabView {
            
            homeView.tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }.background(            Color(.systemGroupedBackground))
            
            settingView.tabItem {
                Image(systemName: "person.crop.circle")
                Text("Setting")
            }.background(background.opacity(0.08))
        }
        
    }
}

struct Previews_TabularView_Previews: PreviewProvider {
    static var previews: some View {
        TabularView()
    }
}
