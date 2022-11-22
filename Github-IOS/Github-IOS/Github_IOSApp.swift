//
//  Github_IOSApp.swift
//  Github-IOS
//
//  Created by groo on 18/11/2022.
//

import SwiftUI

final class Theme: ObservableObject {
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
}

@main
struct Github_IOSApp: App {
    @StateObject var theme = Theme()
    
    var body: some Scene {
        WindowGroup {
            LoginView()
                .preferredColorScheme(theme.isDarkMode ? .dark : .light)
                .environmentObject(theme)
        }
    }
}
