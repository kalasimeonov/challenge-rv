//
//  RVCell.swift
//  RVFinder
//
//  Created by Evelina Zaneva on 23.09.23.
//

import SwiftUI

private extension RVCell {
    enum Constants {
        static let maxWidth = 100.0
        static let maxHeight = 80.0
        static let cornerRadius = 8.0
        static let fontSize = 18.0
    }
}

struct RVCell: View {
    
    let urlString: String
    let rvName: String
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: urlString),
                       content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: Constants.maxWidth, maxHeight: Constants.maxHeight)
                    .cornerRadius(Constants.cornerRadius)
            },
                       placeholder: {
                ShimmerView()
                    .frame(maxWidth: Constants.maxWidth)
                    .frame(height: Constants.maxHeight, alignment: .center)
            })
            Text(rvName)
                .padding(Constants.cornerRadius)
                .font(.system(size: Constants.fontSize))
                .foregroundColor(.gray)
            Spacer()
            Image(systemName: "map")
        }
        .contentShape(Rectangle())
    }
}
