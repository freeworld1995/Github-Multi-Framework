//
//  Endpoint.swift
//  Github-IOS
//
//  Created by groo on 18/11/2022.
//

import Foundation


public enum Scheme : String {
    case http, https
}

public protocol Endpoint {
    associatedtype Response
    
    var scheme: Scheme { get }
    var host: String { get }
    var port: Int? { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var queryItems: [URLQueryItem] { get }
    var headers: [HTTPHeader] { get }
    func prepare(request: inout URLRequest)
    func parse(data: Data, urlResponse: URLResponse) throws -> Response
}

public extension Endpoint {
    var scheme: Scheme { .https }
    var port: Int? { nil }
    var method : HTTPMethod { .get }
    var queryItems: [URLQueryItem] { [] }
    var headers: [HTTPHeader] { [] }
    func prepare(request: inout URLRequest) {}
}
