//
//  HomeViewModel.swift
//  Github-IOS
//
//  Created by groo on 18/11/2022.
//

import SwiftUI

protocol HomeViewModeling {
    func fetchRepositories(forceReload: Bool) async throws -> [Repository]
}

class HomeViewModel: NSObject, ObservableObject {
    private let apiClient: APIClienting
    private var pagination = Pagination(page: 1, perPage: 5)
    @Published private(set) var repositories: [Repository] = []
    
    init(apiClient: APIClienting = APIClient.shared) {
        self.apiClient = apiClient
    }
}

extension HomeViewModel: HomeViewModeling {
    func fetchRepositories(forceReload: Bool) async throws -> [Repository] {
        if forceReload {
            repositories = []
            pagination = Pagination(page: 1, perPage: 5)
        }
        
        return try await apiClient.request(RepositoryRequest(body: pagination))
    }
}
