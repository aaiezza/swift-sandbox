import SwiftUI

struct SettingsRowView: View {
  // MARK: - PROPERTIES

  var name: String
  var withDivider: Bool = true
  var content: String?
  var linkLabel: String?
  var linkDestination: String?

  // MARK: - BODY

  var body: some View {
    VStack {
      if withDivider {
        Divider().padding(.vertical, 4)
      } else {
        Spacer().frame(maxHeight: 1).padding(.vertical, 1)
      }

      HStack {
        Text(name).foregroundColor(.gray)
        Spacer()
        if let content = content {
          Text(content)
        } else if let linkLabel = linkLabel, let linkDestination = linkDestination {
          Link(linkLabel, destination: URL(string: "https://\(linkDestination)")!)
          Image(systemName: "arrow.up.right.square").foregroundColor(.pink)
        }
      }
    }
  }
}

// MARK: - PREVIEW

struct SettingsRowView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      SettingsRowView(name: "Test #", withDivider: false, content: "42")
        .preferredColorScheme(.light)
        .previewLayout(.fixed(width: 375, height: 60))
        .padding()
      SettingsRowView(name: "Test #", withDivider: true, content: "42")
        .preferredColorScheme(.light)
        .previewLayout(.fixed(width: 375, height: 60))
        .padding()
    }

    Group {
      SettingsRowView(name: "Test", withDivider: false, linkLabel: "42", linkDestination: "google.com")
        .preferredColorScheme(.dark)
        .previewLayout(.fixed(width: 375, height: 60))
        .padding()
      SettingsRowView(name: "Test", linkLabel: "42", linkDestination: "google.com")
        .preferredColorScheme(.dark)
        .previewLayout(.fixed(width: 375, height: 60))
        .padding()
    }
  }
}
