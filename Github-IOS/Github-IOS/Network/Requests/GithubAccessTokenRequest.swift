//
//  GithubAccessTokenRequest.swift
//  Github-IOS
//
//  Created by groo on 20/11/2022.
//

import Foundation

public struct GithubAccessTokenRequest: Requesting {
    public typealias Response = AccessToken
    public typealias Error = NSError
    public struct Body: Codable {
        let clientId: String
        let clientSecret: String
        let code: String
        
        enum CodingKeys: String, CodingKey {
            case clientId = "client_id"
            case clientSecret = "client_secret"
            case code
        }
    }
    
    init(clientId: String,
         clientSecret: String,
         code: String) {
        body = .init(clientId: clientId,
                     clientSecret: clientSecret,
                     code: code)
    }
    
    public var httpMethod: HTTPMethod {
        .post
    }
    
    public var baseUrl: URL {
        .init(string: Constants.API.baseURL)!.appending(path: path)
    }
    
    public var path: String {
        "login/oauth/access_token"
    }
    
    public var headers: [HeaderType] {
        return [
            .header(.init(field: "Accept", value: "application/json")),
            .header(.init(field: "Content-Type", value: "application/json")),
        ]
    }
    public var body: Body
    
    public func asURLRequest() throws -> URLRequest {
        var request = URLRequest(url: baseUrl)
        request.httpMethod = httpMethod.value
        headers.map { $0.toHeader() }.forEach { request.setValue($0.value,
                                                                 forHTTPHeaderField: $0.field) }
        request.httpBody = try? JSONEncoder().encode(body)
        
        return request
    }
}
