//
//  HomeViewModel.swift
//  Github-IOS
//
//  Created by groo on 18/11/2022.
//

import SwiftUI

class HomeViewModel: NSObject, ObservableObject{
    @AppStorage("token") var token: String = ""
    private let apiClient: APIClienting
    
    init(apiClient: APIClienting = APIClient.shared) {
        self.apiClient = apiClient
    }
}
