//
//  HomeViewModel.swift
//  Github-IOS
//
//  Created by groo on 18/11/2022.
//

import SwiftUI

class HomeViewModel: NSObject, ObservableObject{
    private let apiClient: APIClienting
    
    init(apiClient: APIClienting = APIClient.shared) {
        self.apiClient = apiClient
    }
}
