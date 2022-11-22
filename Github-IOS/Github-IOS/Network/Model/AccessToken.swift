//
//  AccessToken.swift
//  Github-IOS
//
//  Created by groo on 18/11/2022.
//

import Foundation

public struct AccessToken: Codable {
    let accessToken, tokenType, scope: String

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case scope
    }
}
