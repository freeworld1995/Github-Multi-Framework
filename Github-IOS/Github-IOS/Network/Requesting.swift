//
//  URLRequestConvertible.swift
//  Github-IOS
//
//  Created by groo on 19/11/2022.
//

import Foundation

public protocol Requesting {
    associatedtype Response: Codable
    associatedtype Error
    
    var httpMethod: HTTPMethod { get }
    var headers: [HeaderType] { get set }
    var baseUrl: URL { get }
    var path: String { get }
    
    func asURLRequest() throws -> URLRequest
}
