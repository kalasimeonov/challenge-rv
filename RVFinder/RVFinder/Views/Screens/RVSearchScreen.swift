//
//  RVSearchScreen.swift
//  RVSearchScreen
//
//  Created by Evelina Zaneva on 23.09.23.
//

import SwiftUI

extension RVSearchScreen {
    enum Constants {
        static let navHeight = 30.0
        static let navDividerHeight = 1.0
        static let navTitle = "Keyword Search"
    }
}
struct RVSearchScreen: View {
    
    @ObservedObject private var viewModel = RVSearchScreenViewModel()
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                VStack(alignment: .leading) {
                    VStack {
                        HStack {
                            Spacer()
                            Text(Constants.navTitle)
                            Spacer()
                        }
                        .frame(height: Constants.navHeight)
                        Rectangle()
                            .foregroundColor(.gray)
                            .frame(height: Constants.navDividerHeight)
                        SearchBar(text: $viewModel.searchQuery)
                            .padding()
                    }
                }.padding(.horizontal)
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RVSearchScreen()
    }
}
