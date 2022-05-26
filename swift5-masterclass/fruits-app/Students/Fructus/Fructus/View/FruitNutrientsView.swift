//
//  FruitNutrientsView.swift
//  Fructus
//
//  Created by Alex Aiezza on 5/26/22.
//

import SwiftUI

struct FruitNutrientsView: View {
  // MARK: - PROPERTIES

  var fruit: Fruit
  let nutrients: [String] = ["Energy", "Sugar", "Fat", "Protein", "Vitamins", "Minerals"]

  // MARK: - BODY

  var body: some View {
    GroupBox {
      DisclosureGroup("Nutritional value per 100g") {
        ForEach(0..<nutrients.count, id: \.self) { nutrientIndex in
          if nutrientIndex > 0 {
              Divider().padding(.vertical, 2)
          } else { Spacer(minLength: 12) }

          HStack {
            Group {
              Image(systemName: "info.circle")
              Text(nutrients[nutrientIndex])
            }
            .foregroundColor(fruit.gradientColors.rawValue[1])
            .font(Font.system(.body).bold())

            Spacer(minLength: 25)
            fruit.nutrition[nutrientIndex].asText()
              .multilineTextAlignment(.trailing)
          }
        } //: FOR EACH NUTRIENT
      }
    } //: GROUP BOX
  }
}

// MARK: - PREVIEW

struct FruitNutrientsView_Previews: PreviewProvider {
  static var previews: some View {
    FruitNutrientsView(fruit: fruitsData[7])
      .preferredColorScheme(.dark)
      .previewLayout(.fixed(width: 375, height: 480))
      .padding()
  }
}
