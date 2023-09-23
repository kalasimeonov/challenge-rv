//
//  SearchBar.swift
//  RVFinder
//
//  Created by Evelina Zaneva on 23.09.23.
//

import SwiftUI

extension SearchBar {
    enum Constants {
        static let height = 40.0
        static let fontSize = 18.0
        static let paddingVertical = 7.0
        static let paddingHorizontal = 10.0
        static let cornerRadius = 6.0
        static let borderLineWidth = 1.0
    }
}

struct SearchBar: View {
    
    @Binding var text: String
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            TextField("", text: $text)
                .frame(height: Constants.height)
                .font(.system(size: Constants.fontSize))
                .foregroundColor(.gray)
                .padding(.vertical, Constants.paddingVertical)
                .padding(.horizontal, Constants.paddingHorizontal)
                .onTapGesture {
                    self.isEditing = true
                }
                .cornerRadius(Constants.cornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius:
                                        Constants.cornerRadius).stroke(Color(.gray), lineWidth: Constants.borderLineWidth)
                )
        }
    }
}

