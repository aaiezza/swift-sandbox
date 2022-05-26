import SwiftUI

struct SettingsView: View {
  // MARK: - PROPERTIES

  @Environment(\.presentationMode) var presentationMode

  // MARK: - BODY

  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(spacing: 20) {
          // MARK: SECTION 1
          GroupBox(
            label: SettingsLabelView(
              labelText: "Fructus",
              lableImage: "info.circle")
            ) {
              Divider().padding(.vertical, 4)

              HStack(alignment: .center, spacing: 10) {
                Image("logo")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 80, height: 80)
                  .cornerRadius(9)
                Text("Most fruits are naturaly low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more.")
                  .font(.footnote)
              }
            }

          // MARK: SECTION 2
          GroupBox(
            label: SettingsLabelView(
              labelText: "Fructus",
              lableImage: "info.circle")
            ) {
              Text("Hello, World!")
            }

          // MARK: SECTION 3
          GroupBox(
            label: SettingsLabelView(
              labelText: "Fructus",
              lableImage: "info.circle")
            ) {
              Text("Hello, World!")
            }
        } //: VSTACK
        .navigationBarTitle(Text("Settings"), displayMode: .large)
        .navigationBarItems(
          trailing: Button(action: {
            presentationMode.wrappedValue.dismiss()
          }) {
            Image(systemName: "xmark")
          })
          .padding()
      } //: SCROLL
    } //: NAVIGATION
  }
}

// MARK: - PREVIEW

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
      .preferredColorScheme(.dark)
      .previewDevice("iPhone 13 Pro")
  }
}