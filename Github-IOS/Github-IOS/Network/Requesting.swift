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
    associatedtype Body: Codable
    
    var httpMethod: HTTPMethod { get }
    var headers: [HeaderType] { get }
    var baseUrl: URL { get }
    var path: String { get }
    var body: Body { get set }
    
    func asURLRequest() throws -> URLRequest
}
