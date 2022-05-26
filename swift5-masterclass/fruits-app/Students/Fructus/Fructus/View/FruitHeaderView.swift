//
//  FruitHeaderView.swift
//  Fructus
//
//  Created by Alex Aiezza on 5/25/22.
//

import SwiftUI

struct FruitHeaderView: View {
  // MARK: - PROPERTIES

  var fruit: Fruit

  @State private var isAnimatingImage: Bool = false

  // MARK: - BODY

  var body: some View {
    ZStack {
      fruit.getLinearGradient(startPoint: .topLeading, endPoint: .bottomTrailing)

      fruit.image.asImage()
        .resizable()
        .scaledToFit()
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
        .padding(.vertical, 20)
        .scaleEffect(isAnimatingImage ? 1.0 : 0.6 )
    } //: ZSTACK
    .frame(height: 440)
    .onAppear {
      withAnimation(.easeOut(duration: 0.55)) {
        isAnimatingImage = true
      }
    }
  }
}

// MARK: - PREVIEW

struct FruitHeaderView_Previews: PreviewProvider {
  static var previews: some View {
    FruitHeaderView(fruit: fruitsData[4])
      .previewLayout(.fixed(width: 375, height: 440))
  }
}
