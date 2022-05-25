//
//  FruitRowView.swift
//  Fructus
//
//  Created by Alex Aiezza on 5/25/22.
//

import SwiftUI

struct FruitRowView: View {
  // MARK: - PROPERTIES

  var fruit: Fruit

  // MARK: - BODY

    var body: some View {
      HStack {
        fruit.image.asImage()
          .renderingMode(.original)
          .resizable()
          .scaledToFit()
          .frame(width: 80, height: 80, alignment: .center)
          .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 3, x: 2, y: 2)
          .background(fruit.getLinearGradient())
          .cornerRadius(17)
        
        VStack(alignment: .leading, spacing: 5) {
          fruit.title.asText()
            .font(.title2)
            .fontWeight(.bold)
          fruit.headline.asText()
            .font(.caption)
            .foregroundColor(Color.secondary)
        } //: VSTACK
      } //: HSTACK
    }
}

// MARK: - PREVIEW

struct FruitRowView_Previews: PreviewProvider {
    static var previews: some View {
      FruitRowView(fruit: fruitsData[3])
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
