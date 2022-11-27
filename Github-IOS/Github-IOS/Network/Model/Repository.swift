//
//  Repository.swift
//  Github-IOS
//
//  Created by groo on 27/11/2022.
//

import Foundation

struct Repository: Codable {
    let id: Int
    let name: String
    let fullName: String
    let owner: RepoOwner
    let updatedAt: Date
    let createdAt: Date
    let forkCount: Int
    let stargazersCount:Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case owner
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case forkCount = "fork_count"
        case stargazersCount = "stargazers_count"
    }
}
