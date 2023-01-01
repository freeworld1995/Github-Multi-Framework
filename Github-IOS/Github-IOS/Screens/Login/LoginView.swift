//
//  LoginView.swift
//  Github-IOS
//
//  Created by groo on 20/11/2022.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    
    var body: some View {
        if viewModel.isLogin {
            HomeView()
        } else {
            loginView
        }
    }
    
    @ViewBuilder private var loginView: some View {
        VStack {
            Button {
                Task {
                    try await viewModel.login()
                }
            } label: {
                HStack(spacing: 10) {
                    Text("Login")
                        .foregroundColor(.white)
                    Image("github")
                        .renderingMode(.original)
                        .colorInvert()
                }
                .padding(.init(top: 10, leading: 20, bottom: 10, trailing: 20))
            }
            .background(Color.text)
            .cornerRadius(20)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
        .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
