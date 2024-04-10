//
//  ContentView.swift
//  TrainingApp
//
//  Created by kysel95 on 30/09/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .house
    @StateObject var viewModel = ContentViewModel()
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                TabView( selection: $selectedTab) {
                    CurrentUserProfileView()
                        .tag(1)
                    Text("Tab Content 2")
                        .tag(2)
                    Text("Tab Content 3")
                        .tag(3)
                    Text("Tab Content 4")
                        .tag(4)
                    Text("Tab Content 5")
                        .tag(5)
                }
                .overlay(alignment: .bottom ) {
                    HomeTabView(selectedTab: $selectedTab)
                }
            } else {
                LoginView()
            }
        }
    }
}
// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
