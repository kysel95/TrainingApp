//
//  ContentView.swift
//  TrainingApp
//
//  Created by kysel95 on 30/09/2023.
//

import SwiftUI

struct ContentView: View {

    @StateObject var viewModel = ContentViewModel()

    var body: some View {
        // MARK: - Display LoginView as first page
        Group {
            if viewModel.userSession != nil {
                HomeTabView()
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
