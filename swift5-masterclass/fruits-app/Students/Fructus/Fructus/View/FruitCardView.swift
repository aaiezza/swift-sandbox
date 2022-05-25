//
//  FruitCardView.swift
//  Fructus (iOS)
//
//  Created by Alex Aiezza on 5/25/22.
//

import SwiftUI

struct FruitCardView: View {
  // MARK: - PROPERTIES

  var fruit: Fruit

  @State private var isAnimating: Bool = false

  // MARK: - BODY
  var body: some View {
    ZStack {
      VStack(spacing: 20) {
        // FRUIT: IMAGE
        fruit.image.asImage()
          .resizable()
          .scaledToFit()
          .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 8, x: 6, y: 8)

        // FRUIT: TITLE
        fruit.title.asText()
          .foregroundColor(.white)
          .font(.largeTitle)
          .fontWeight(.heavy)
          .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.17), radius: 2, x: 2, y: 2)
          .scaleEffect(isAnimating ? 1.0 : 0.65)

        // FRUIT: HEADLINE
        fruit.headline.asText()
          .foregroundColor(.white)
          .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.08), radius: 2, x: 2, y: 2)
          .multilineTextAlignment(.center)
          .padding(.horizontal, 16)
          .frame(maxWidth: 480)

        // BUTTON: START
        StartButtonView()

      } //: VSTACK
    } //: ZSTACK
    .onAppear {
      withAnimation(.easeOut(duration: 0.5)) {
        isAnimating = true
      }
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    .background(fruit.getLinearGradient())
    .cornerRadius(22)
    .padding(.horizontal, 20)
  }
}

// MARK: - PREVIEW

struct FruitCardView_Previews: PreviewProvider {
  static var previews: some View {
    FruitCardView(fruit: fruitsData[0])
      .padding(.vertical, 38)
      .previewLayout(.fixed(width: 320, height: 640))
  }
}

// MARK: - EXTENSIONS

// TODO: shadow shortcut extension function
