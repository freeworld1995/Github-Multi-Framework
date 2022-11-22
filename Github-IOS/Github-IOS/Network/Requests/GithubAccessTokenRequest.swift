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
    
    init(clientId: String,
         clientSecret: String,
         code: String) {
        headers =  [
            .header(.init(field: "client_id", value: clientId)),
            .header(.init(field: "client_secret", value: clientSecret)),
            .header(.init(field: "code", value: code))
        ]
    }
    
    public var httpMethod: HTTPMethod {
        .post
    }
    
    public var baseUrl: URL {
        .init(string: Constants.API.baseURL)!.appending(path: path)
    }
    
    public var path: String {
        ""
    }
    
    public var headers: [HeaderType]
    
    public func asURLRequest() throws -> URLRequest {
        var request = URLRequest(url: baseUrl)
        request.httpMethod = httpMethod.value
        
        return request
    }
}
