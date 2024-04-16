//
//  HomeTabView.swift
//  TrainingApp
//
//  Created by kysel95 on 26/03/2024.
//

import Foundation
import SwiftUI

struct HomeTabView: View {

    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            TestProfileView()
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                    Text("Home")
                }
                .onAppear { selectedTab = 0 }
                .tag(0)

            TestProfileView()
                .tabItem {
                    Image(systemName: selectedTab == 1 ? "dumbbell.fill" : "dumbbell")
                        .environment(\.symbolVariants, selectedTab == 1 ? .fill : .none)
                    Text("Exercises")
                }
                .onAppear { selectedTab = 1 }
                .tag(1)

            TestProfileView()
                .tabItem {
                    Image(systemName: selectedTab == 2 ? "figure.run.circle.fill" : "figure.run.circle")
                        .environment(\.symbolVariants, selectedTab == 2 ? .fill : .none)
                    Text("Workout")
                }
                .onAppear { selectedTab = 2 }
                .tag(2)

            TestProfileView()
                .tabItem {
                    Image(systemName: selectedTab == 3 ? "clock.fill" : "clock")
                        .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                    Text("History")
                }
                .onAppear { selectedTab = 3 }
                .tag(3)

            CurrentUserProfileView()
                .tabItem {
                    Image(systemName: selectedTab == 4 ? "person.fill" : "person")
                        .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                    Text("Profile")
                }
                .onAppear { selectedTab = 4 }
                .tag(4)
        }
        .onAppear() {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }
}
struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
