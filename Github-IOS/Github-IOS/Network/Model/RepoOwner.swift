//
//  RepoOwner.swift
//  Github-IOS
//
//  Created by groo on 27/11/2022.
//

import Foundation

struct RepoOwner: Codable {
    let login: String
    let avatarUrl: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
        case url
    }
}
