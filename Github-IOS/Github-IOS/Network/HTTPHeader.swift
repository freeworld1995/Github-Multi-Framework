//
//  HTTPHeader.swift
//  Github-IOS
//
//  Created by groo on 18/11/2022.
//

import Foundation

public protocol HTTPHeader {
    var field: String { get }
    var value: String { get }
}

public enum Auth : HTTPHeader {
    case bearer(token: String)
    case basic(String)
    
    public var field: String {
        return "Authorization"
    }
    
    public var value: String {
        switch self {
        case .bearer(let token):
            return "Bearer \(token)"
        case .basic(let string):
            return "Basic \(string)"
        }
    }
}

public enum MIMEType : String {
    case json = "application/json"
    case githubJson = "application/vnd.github+json"
    case xml = "application/xml"
    case urlencoded = "application/x-www-form-urlencoded"
}

public struct Accept : HTTPHeader {
    public let mimeType: MIMEType
    
    public init(_ mimeType: MIMEType) {
        self.mimeType = mimeType
    }
    
    public let field: String = "Accept"
    public var value: String { mimeType.rawValue }
}

public struct ContentType : HTTPHeader {
    public let mimeType: MIMEType
    
    public init(_ mimeType: MIMEType) {
        self.mimeType = mimeType
    }
    
    public let field: String = "Content-Type"
    public var value: String { mimeType.rawValue }
}

public struct Header : HTTPHeader {
    public let field: String
    public let value: String
    
    public init(field: String, value: String) {
        self.field = field
        self.value = value
    }
}

public enum HeaderType {
    case header(Header)
    case auth(Auth)
    case mime(Accept)
    
    func toHeader() -> HTTPHeader {
        switch self {
        case .header(let header):
            return header
        case .auth(let auth):
            return auth
        case .mime(let mIMEType):
            return mIMEType
        }
    }
}

public extension URLRequest {
    mutating func addHeader(_ header: HTTPHeader) {
        addValue(header.value, forHTTPHeaderField: header.field)
    }
    
    mutating func setHeader(_ header: HTTPHeader) {
        setValue(header.value, forHTTPHeaderField: header.field)
    }
}
