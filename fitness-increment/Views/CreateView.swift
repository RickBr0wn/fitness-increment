//
//  CreateView.swift
//  fitness-increment
//
//  Created by Rick Brown on 15/02/2021.
//

import SwiftUI

struct CreateView: View {
  @State private var isActive: Bool = false
  
  var body: some View {
    ScrollView {
      VStack {
        DropDownView()
        DropDownView()
        DropDownView()
        DropDownView()
        Spacer()
        
        NavigationLink(
          destination: RemindView(),
          isActive: $isActive) {
          Button(action: {
            isActive = true
          }) {
            Text("next".capitalized)
              .font(.system(size: 24, weight: .medium))
          }
          .accentColor(.primary)
        }
      }
      .navigationBarTitle("Create")
      .navigationBarBackButtonHidden(true)
      .padding(.bottom, 15)
    }
  }
}

struct CreateView_Previews: PreviewProvider {
  static var previews: some View {
    CreateView()
  }
}
