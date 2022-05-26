import SwiftUI

struct FruitNutrientsView: View {
  // MARK: - PROPERTIES

  var fruit: Fruit

  // MARK: - BODY

  var body: some View {
    GroupBox {
      DisclosureGroup("Nutritional value per 100g") {
        ForEach(0..<fruit.nutritionFacts.count, id: \.self) { i in
          if i > 0 {
              Divider().padding(.vertical, 2)
          } else { Spacer(minLength: 12) }

          HStack {
            Group {
              Image(systemName: "info.circle")
              Text(fruit.nutritionFacts[i].category.rawValue.capitalized)
            }
            .foregroundColor(fruit.gradientColors.rawValue[1])
            .font(Font.system(.body).bold())

            Spacer(minLength: 25)
            fruit.nutritionFacts[i].value.asText()
              .font(Font.system(.subheadline).monospaced())
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
