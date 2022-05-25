//
//  StartButtonView.swift
//  Fructus
//
//  Created by Alex Aiezza on 5/25/22.
//

import SwiftUI

struct StartButtonView: View {
  // MARK: - PROPERTIES

  // MARK: - BODY

  var body: some View {
    Button(action: {
      print("Exit the onboarding")
    }) {
      HStack(spacing: 8) {
        Text("Start")

        Image(systemName: "arrow.right.circle")
          .imageScale(.large)
      } //: HSTACK
      .padding(.horizontal, 16)
      .padding(.vertical, 10)
      .background(Capsule().strokeBorder(.white, lineWidth: 1.5))
    } //: BUTTON
    .accentColor(.white)
  }
}

// MARK: - PREVIEW

struct StartButtonView_Previews: PreviewProvider {
  static var previews: some View {
    StartButtonView()
      .preferredColorScheme(.dark)
      .previewLayout(.sizeThatFits)
  }
}
