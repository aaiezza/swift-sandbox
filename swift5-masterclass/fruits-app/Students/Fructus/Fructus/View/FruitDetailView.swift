//
//  FruitDetailView.swift
//  Fructus
//
//  Created by Alex Aiezza on 5/25/22.
//

import SwiftUI

struct FruitDetailView: View {
  // MARK: - PROPERTIES

  var fruit: Fruit

  // MARK: - BODY

  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .center, spacing: 20) {
          // HEADER
          FruitHeaderView(fruit: fruit)

          VStack(alignment: .leading, spacing: 20) {
            // TITLE
            fruit.title.asText()
              .font(.largeTitle)
              .fontWeight(.heavy)
              .foregroundColor(fruit.gradientColors.rawValue[1])

            // HEADLINE
            fruit.headline.asText()
              .font(.headline)
              .multilineTextAlignment(.leading)

            // NUTRIENTS
            FruitNutrientsView(fruit: fruit)

            // SUBHEADLINE
            Text("Learn more about \(fruit.title.rawValue)".uppercased())
              .fontWeight(.bold)
              .foregroundColor(fruit.gradientColors.rawValue[1])

            // DESCRIPTION
            fruit.description.asText()
              .multilineTextAlignment(.leading)

            // LINK
            SourceLinkView(wikiPage: fruit.title.rawValue)
              .padding(.top, 10)
              .padding(.bottom, 40)

          } //: VSTACK
          .padding(.horizontal, 20)
          .frame(maxWidth: 640, alignment: .center)
        } //: VSTACK
        .navigationBarTitle(fruit.title.rawValue, displayMode: .inline)
        .navigationBarHidden(true)
      } //: SCROLL
      .edgesIgnoringSafeArea(.top)
    } //: NAVIGATION
  }
}

// MARK: - PREVIEW

struct FruitDetailView_Previews: PreviewProvider {
  static var previews: some View {
    FruitDetailView(fruit: fruitsData[0])
      .preferredColorScheme(.dark)
      .previewDevice("iPhone 13 Pro")
  }
}
