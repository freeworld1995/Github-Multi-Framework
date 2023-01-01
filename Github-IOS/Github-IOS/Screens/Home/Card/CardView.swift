//
//  CardView.swift
//  Github-IOS
//
//  Created by groo on 23/11/2022.
//

import SwiftUI

extension Color {
    static let star: Color = Color("yellow")
    static let card: Color = Color("card")
    static let text: Color = Color("text")
    static let background: Color = Color("background")
}

struct CardView: View {
    var body: some View {
        VStack(spacing: 0) {
            Group {
                HStack(spacing: 10) {
                    Image(systemName: "square.and.arrow.up.circle")
                        .frame(width: 24, height: 24)
                        .border(.blue)
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,12213123213")
                        .padding(.init(top: 20, leading: 0, bottom: 20, trailing: 0))
                        .frame(alignment: .leading)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                // Divider
                Divider()
                    .frame(height: 1)
                    .overlay(Color("text"))
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("repo title")
                        .foregroundColor(Color("text"))
                    Text("Subtitle")
                }
                .padding(.init(top: 16, leading: 0, bottom: 16, trailing: 0))
                .frame(maxWidth: .infinity,
                       alignment: .leading)
                
                HStack {
                    HStack(spacing: 4) {
                        Circle()
                            .fill(Color(.brown))
                            .frame(width: 12, height: 12)
                        Text("Javascript")
                    }
                    Spacer()
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.star)
                            .frame(width: 12, height: 12)
                        Text("2.1k")
                    }
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "star.fill")
                            .foregroundColor(.star)
                            .frame(width: 18, height: 18)
                        Text("Star")
                            .foregroundColor(Color(.white))
                    }
                    .padding(.init(top: 10, leading: 16, bottom: 10, trailing: 16))
                    .background(Color(.red))
                    .cornerRadius(24)

                }
                .frame(maxWidth: .infinity)
            }
            .padding(.init(top: 0, leading: 24, bottom: 0, trailing: 24))
           
        }
        .fullscreen()
        .background(Color("background"))
        .frame(maxHeight: 300)
    }
}

struct Previews_CardView: PreviewProvider {
    static var previews: some View {
        CardView()
            .frame(maxHeight: 300)
    }
}
