//
//  ContentView.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 05/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            TabularView()
        }.navigationBarTitleDisplayMode(.inline)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
