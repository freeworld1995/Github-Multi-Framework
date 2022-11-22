//
//  ContentView.swift
//  Github-IOS
//
//  Created by groo on 18/11/2022.
//

import SwiftUI
import AuthenticationServices

struct HomeView: View {
    @EnvironmentObject var theme: Theme
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Image(systemName: "menubar.arrow.down.rectangle")
                    .font(.system(.title))
                    .foregroundColor(Color("text"))
                Spacer()
                Text("GitHub")
                    .foregroundColor(Color("text"))
                Spacer()
                HStack(spacing: 10) {
                    Image(systemName: "sun.min")
                        .font(.system(.title))
                        .foregroundColor(Color("text"))
                        .onTapGesture {
                            theme.isDarkMode.toggle()
                        }
                    Image(systemName: "magnifyingglass")
                        .font(.system(.title))
                        .foregroundColor(Color("text"))
                }
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            .border(.red)
            
            // Contents ScrollView
            ScrollView {
                LazyVStack(alignment: .leading) {
                    // Paralax header
                    GeometryReader { reader -> AnyView in
                        let offset = reader.frame(in: .named("scrollview")).minY
                        print(offset)
                        return AnyView(
                            Image("user")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: UIScreen.main.bounds.width,
                                       height: 250 + (offset > 0 ? offset : 0))
                                .offset(y: (offset > 0 ? -offset : 0))
                        )
                    }
                    .frame(height: 250)
                }
            }
            .coordinateSpace(name: "scrollview")
            .background(Color.brown)
        }
        .background(Color("background").ignoresSafeArea())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
