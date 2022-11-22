//
//  HTTPMethod.swift
//  Github-IOS
//
//  Created by groo on 18/11/2022.
//

import Foundation

public enum HTTPMethod {
    case get
    case post
    case put
    case patch
    case delete
    
    var value: String {
        switch self {
        case .get: return "GET"
        case .post: return "POST"
        case .put: return "PUT"
        case .patch: return "PATCH"
        case .delete: return "DELETE"
        }
    }
}
