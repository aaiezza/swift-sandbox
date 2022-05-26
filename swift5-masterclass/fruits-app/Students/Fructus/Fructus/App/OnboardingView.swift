import SwiftUI

struct OnboardingView: View {
  // MARK: - PROPERTIES

  var fruits: [Fruit] = fruitsData

  // MARK: - BODY
  var body: some View {
    TabView {
      ForEach(fruits) { fruit in
        FruitCardView(fruit: fruit)
      } //: LOOP
    } //: TAB
    .tabViewStyle(PageTabViewStyle())
    .padding(.vertical, 20)
  }
}

// MARK: - PREVIEW

struct OnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingView(fruits: fruitsData.sorted {
      $0.title.rawValue < $1.title.rawValue
    })
  }
}
