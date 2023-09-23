//
//  ShimmerView.swift
//  RVFinder
//
//  Created by Evelina Zaneva on 23.09.23.
//

import SwiftUI

private extension ShimmerView {
    enum Constants {
        static let duration: Double = 0.8
        static let minOpacity: Double = 0.25
        static let maxOpacity: Double = 0.5
        static let cornerRadius: CGFloat = 8.0
    }
}
struct ShimmerView: View {
    
    @State private var opacity: Double = Constants.minOpacity
    
    public init() {}
    
    public var body: some View {
        RoundedRectangle(cornerRadius: Constants.cornerRadius)
            .fill(.gray)
            .opacity(opacity)
            .transition(.opacity)
            .onAppear {
                let baseAnimation = Animation.easeInOut(duration: Constants.duration)
                let repeated = baseAnimation.repeatForever(autoreverses: true)
                withAnimation(repeated) {
                    self.opacity = Constants.maxOpacity
                }
            }
    }
}
