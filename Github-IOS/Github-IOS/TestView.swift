//
//  TestView.swift
//  Github-IOS
//
//  Created by groo on 27/11/2022.
//

import SwiftUI

struct TestView: View {
    @State private var isLoading = true

       var body: some View {
           Text("Swift by Sundell")
               .font(.title)
               .padding(35)
               .background(
                   LinearGradient(
                       colors: [.orange, .red],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing
                   )
               )
               .overlay(starOverlay, alignment: .topTrailing)
               .overlay(loadingOverlay)
               .foregroundColor(.white)
               .cornerRadius(20)
               .onTapGesture {
                   isLoading.toggle()
               }
       }
    
    private var starOverlay: some View {
            Image(systemName: "star")
                .padding([.top, .trailing], 5)
        }
    
    @ViewBuilder private var loadingOverlay: some View {
            if isLoading {
                ZStack {
                    Color(white: 0, opacity: 0.75)
                    ProgressView().tint(.white)
                }
    }
        }
}

struct Previews_TestView: PreviewProvider {
    static var previews: some View {
        return TestView()
    }
}
