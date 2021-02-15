//
//  ContentView.swift
//  fitness-increment
//
//  Created by Rick Brown on 15/02/2021.
//

import SwiftUI

struct LandingView: View {
  @State private var isActive: Bool = false
  
  var body: some View {
    NavigationView {
      GeometryReader { proxy in
        VStack {
          Spacer()
            .frame(height: proxy.size.height * 0.22)
          
          Text("Increment")
            .font(.system(size: 64, weight: .bold))
            .foregroundColor(.white)
          
          Spacer()
          
          NavigationLink(
            destination: CreateView(),
            isActive: $isActive) {
            Button(action: {
              isActive = true
            }) {
              HStack {
                Spacer()
                Image(systemName: "plus.circle")
                  .font(.system(size: 18, weight: .semibold))
                Text("Create yourself a Challenge")
                  .font(.system(size: 20, weight: .semibold))
                Spacer()
              }
              .foregroundColor(.white)
            }
            .padding(15)
            .buttonStyle(PrimaryButtonStyle())
          }
          
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("girl")
                      .resizable()
                      .aspectRatio(contentMode: .fill)
                      .overlay(Color.black.opacity(0.5))
                      .frame(width: proxy.size.width)
                      .edgesIgnoringSafeArea(.all)
        )
      }
    }
    .accentColor(.primary)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      LandingView()
        .previewDevice("iPhone 12")
      
      LandingView()
        .previewDevice("iPhone 11 Pro")
      
      LandingView()
        .previewDevice("iPhone 8")
    }
  }
}

