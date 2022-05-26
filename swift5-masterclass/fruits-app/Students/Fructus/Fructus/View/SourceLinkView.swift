//
//  FruitLinkView.swift
//  Fructus
//
//  Created by Alex Aiezza on 5/25/22.
//

import SwiftUI

struct SourceLinkView: View {
  // MARK: - PROPERTIES

  var wikiPage: String = ""

  // MARK: - BODY

  var body: some View {
    GroupBox {
      HStack {
        Text("Content source")
        Spacer()
        Link("Wikipedia", destination: URL(string: "https://wikipedia.org/wiki/\(wikiPage)_(fruit)")!)
        Image(systemName: "arrow.up.right.square")
      }
      .font(.footnote)
    }
  }
}

// MARK: - PREVIEW

struct FruitLinkView_Previews: PreviewProvider {
  static var previews: some View {
    SourceLinkView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
