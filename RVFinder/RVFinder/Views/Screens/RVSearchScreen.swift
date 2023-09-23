//
//  RVSearchScreen.swift
//  RVSearchScreen
//
//  Created by Evelina Zaneva on 23.09.23.
//

import SwiftUI

private extension RVSearchScreen {
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
                    if let recVehicles = viewModel.recVehicles {
                        ForEach(recVehicles.data.indices, id: \.self) { index in
                            let rv = recVehicles.data[index]
                            NavigationLink {
                                RVMapLocation(place: .init(name: "", latitude: rv.attributes.location.lat, longitude: rv.attributes.location.lng), region: .init(center: .init(latitude: rv.attributes.location.lat, longitude: rv.attributes.location.lng), latitudinalMeters: 0.3, longitudinalMeters: 0.3))
                            } label: {
                                HStack {
                                    AsyncImage(url: URL(string: rv.attributes.primaryImageURL),
                                               content: { image in
                                        image.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: 100, maxHeight: 80)
                                            .cornerRadius(8.0)
                                    },
                                               placeholder: {
                                        ShimmerView()
                                            .frame(maxWidth: 100)
                                            .frame(height: 80, alignment: .center)
                                    })
                                    Text(rv.attributes.name)
                                        .padding(8)
                                        .font(.system(size: 18))
                                        .foregroundColor(.gray)
                                }
                                .contentShape(Rectangle())
                            }
                        }
                        .padding(.horizontal)
                    }
                    Spacer()
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        .onReceive(viewModel.$searchQuery.debounce(for: 1.5, scheduler: RunLoop.main)) { query in
            guard !query.isEmpty else { return }
            Task {
                await viewModel.fetchRecVehicles(query)
            }
        }
    }
}
