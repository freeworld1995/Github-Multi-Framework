//
//  APIClient.swift
//  Github-IOS
//
//  Created by groo on 20/11/2022.
//

import Foundation

protocol APIClienting {
    func request<Response: Decodable>(_ request: some Requesting) async throws -> Response
}

public final class APIClient: APIClienting {
    public static let shared = APIClient()
    
    private let session: URLSession
    private let logger: Logging
    
    init(session: URLSession = URLSession.shared,
         logger: Logging = Logger()) {
        self.session = session
        self.logger = logger
    }
    
    func request<Response: Decodable>(_ request: some Requesting) async throws -> Response {
        let request = try request.asURLRequest()
        logger.network("Requesting: \(request.url?.debugDescription ?? "")")
        let (data, response) = try await session.data(for: request)
        logger.network(response.debugDescription)
        let object: Response = try decode(data: data)
        logger.network("Response: \(object)")
        return object
    }
    
    private func decode<Response: Decodable>(data: Data) throws -> Response {
        let decoder = JSONDecoder()
        return try decoder.decode(Response.self, from: data)
    }
}
