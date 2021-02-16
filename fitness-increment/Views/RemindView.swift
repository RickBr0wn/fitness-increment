//
//  RemindView.swift
//  fitness-increment
//
//  Created by Rick Brown on 15/02/2021.
//

import SwiftUI

struct RemindView: View {
  var body: some View {
    VStack {
      Spacer()
//      DropDownView()
      Spacer()
      Button(action: {}) {
        Text("next".capitalized)
          .font(.system(size: 24, weight: .medium))
          .foregroundColor(.primary)
          .padding(.bottom, 15)
      }
      
      Button(action: {}) {
        Text("skip".capitalized)
          .font(.system(size: 24, weight: .medium))
          .foregroundColor(.primary)
      }
    }
    .navigationBarTitle("Remind")
    .padding(.bottom, 15)
  }
}

struct RemindView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      RemindView()
        .preferredColorScheme(.dark)
    }
  }
}
