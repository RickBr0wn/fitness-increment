//
//  CreateView.swift
//  fitness-increment
//
//  Created by Rick Brown on 15/02/2021.
//

import SwiftUI

struct CreateView: View {
  @StateObject var viewModel = CreateChallengeViewModel()
  @State private var isActive: Bool = false
  
  var dropdownList: some View {
    ForEach(viewModel.dropdowns.indices, id: \.self) { index in
      DropDownView(viewModel: $viewModel.dropdowns[index])
    }
  }
  
  var body: some View {
    ScrollView {
      VStack {
        dropdownList
        
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
