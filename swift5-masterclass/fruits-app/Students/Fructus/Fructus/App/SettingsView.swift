import SwiftUI

struct SettingsView: View {
  // MARK: - PROPERTIES

  @Environment(\.dismiss) var dismiss
  @AppStorage("isOnboarding") var isOnboarding: Bool = false
  @State private var isRestarted: Bool = false

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
              labelText: "Customization",
              lableImage: "paintbrush")
          ) {
            Spacer().frame(maxHeight: 1).padding(.vertical, 1)
            Text("If you wish, you can restart the application by toggling the switch in this box. That way, you can start the onboarding process and you will see the welcome screen again.")
              .padding(.vertical, 8)
              .frame(minHeight: 60)
              .layoutPriority(1)
              .multilineTextAlignment(.leading)

            Toggle(isOn: $isRestarted) {
              Text((isRestarted ? "Restarted" : "Restart").uppercased())
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(isRestarted ? .green : .secondary)
            }
            .padding()
            .background(Color(UIColor.tertiarySystemBackground).clipShape(RoundedRectangle(cornerRadius: 9, style: .continuous)))
          }

          // MARK: SECTION 3
          GroupBox(
            label: SettingsLabelView(
              labelText: "Application",
              lableImage: "apps.iphone")
          ) {
            SettingsRowView(name: "Develooper", withDivider: false, content: "Alessandro Aiezza II")
            SettingsRowView(name: "Designer", content: "Robert Petras")
            SettingsRowView(name: "Compatibility", content: "iOS 14")
            SettingsRowView(name: "Website", linkLabel: "SwiftUI Masterclass", linkDestination: "swiftuimasterclass.com")
            SettingsRowView(name: "Twitter", linkLabel: "@scribaniwannabe", linkDestination: "twitter.com/scribaniwannabe")
            SettingsRowView(name: "SwiftUI", content: "3.0")
            SettingsRowView(name: "Version", content: "1.1.0")

          }
        } //: VSTACK
        .navigationBarTitle(Text("Settings"), displayMode: .large)
        .navigationBarItems(
          trailing: Button(action: {
            isOnboarding = isRestarted // "magic" is here
            dismiss() // close the sheet
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
