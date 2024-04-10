//
//  HomeTabView.swift
//  TrainingApp
//
//  Created by kysel95 on 26/03/2024.
//

import Foundation
import SwiftUI

struct HomeTabView: View {
    //let user: User
    //let size: Tab
    @Binding var selectedTab: Tab
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    VStack {
                        Image(systemName: selectedTab == tab ? fillImage :
                                tab.imageName)
                        .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
                        .foregroundColor(selectedTab == tab ? .blue : .gray)
                        .font(.system(size: 22))
                        .frame(width: 30, height: 30)
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                        Text(tab.title)
                            .font(.caption)

                    }
                    Spacer()
                }
            }
            .frame(width: nil, height: 60)
            .background(.thinMaterial)
            .cornerRadius(10)
            .padding()
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        //HomeTabView(user: dev.user,size: .house, selectedTab: .constant(.house))
        HomeTabView(selectedTab: .constant(.house))
    }
}
