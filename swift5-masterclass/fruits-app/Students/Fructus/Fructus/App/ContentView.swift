import SwiftUI

struct ContentView: View {
  // MARK: - PROPERTIES

  @State private var isShowingSettings: Bool = false

  var fruits: [Fruit] = fruitsData

  // MARK: - BODY

  var body: some View {
    NavigationView {
      List {
        ForEach(fruits.shuffled()) { fruit in
          NavigationLink(destination: FruitDetailView(fruit: fruit)) {
            FruitRowView(fruit: fruit)
              .padding(.vertical, 4)
          } //: NAVIGATION LINK
        } //: FOR EACH FRUIT
      } //: LIST
      .navigationTitle(Text("Fruits"))
      .navigationBarItems(
        trailing:
          Button(action: {
            isShowingSettings = true
          }) {
            Image(systemName: "slider.horizontal.3")
          } //: BUTTON
          .sheet(isPresented: $isShowingSettings) {
            SettingsView()
          }
      )
    } //: NAVIGATION
  }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
      ContentView(fruits: fruitsData.sorted {
        $0.title.rawValue < $1.title.rawValue
      })
      .preferredColorScheme(.dark)
      .previewDevice("iPhone 13 Pro")
  }
}
