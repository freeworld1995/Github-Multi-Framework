//
//  RepositoryRequest.swift
//  Github-IOS
//
//  Created by groo on 27/11/2022.
//

import Foundation

struct Pagination: Codable {
    let page: Int
    let perPage: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
    }
}

struct RepositoryRequest: Requesting {
    typealias Response = [Repository]
    typealias Error = NSError
    typealias Body = Pagination
    
    var httpMethod: HTTPMethod {
        .get
    }
    
    var headers: [HeaderType] {
        [.mime(.init(.githubJson)),
         .auth(.bearer(token: Constants.UserDefaults.token))]
    }
    
    var baseUrl: URL {
        .init(string: Constants.API.baseURL)!.appending(path: path)
    }
    
    var path: String {
        "user/repos"
    }
    
    var body: Body
    
    func asURLRequest() throws -> URLRequest {
        var request = URLRequest(url: baseUrl)
        request.httpMethod = httpMethod.value
        headers.map { $0.toHeader() }.forEach { request.setValue($0.value,
                                                                 forHTTPHeaderField: $0.field) }
        request.httpBody = try? JSONEncoder().encode(body)
        
        return request
    }
    
    
}
