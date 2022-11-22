//
//  LoginViewModel.swift
//  Github-IOS
//
//  Created by groo on 20/11/2022.
//

import Foundation
import AuthenticationServices

protocol LoginViewModeling {
    func login() async throws
}

final class LoginViewModel: NSObject, ObservableObject {
    private let apiClient: APIClienting
    
    init(apiClient: APIClienting = APIClient.shared) {
        self.apiClient = apiClient
    }
}

// MARK: - ASWebAuthenticationPresentationContextProviding
extension LoginViewModel: ASWebAuthenticationPresentationContextProviding {
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        ASPresentationAnchor()
    }
}

// MARK: - LoginViewModeling
extension LoginViewModel: LoginViewModeling {
    func signIn() async -> String? {
        await withCheckedContinuation { continuation in
            let url = URL(string: "http://github.com/login/oauth/authorize?client_id=de8132a20056a5f3ad7b&scope=repo")!
            let session = ASWebAuthenticationSession(url: url, callbackURLScheme: nil) { url, error in
                if let error = error {
                    Logger.shared.network(error.localizedDescription)
                    continuation.resume(returning: nil)
                }
                let oauthToken = NSURLComponents(string: (url?.absoluteString)!)?.queryItems?.filter({$0.name == "code"}).first
                continuation.resume(returning: oauthToken?.value)
            }
            session.presentationContextProvider = self
            
            DispatchQueue.main.async {
                session.start()
            }
        }
    }
    
    func createAccessToken(clientId: String,
                           clientSecret: String,
                           code: String) async throws -> AccessToken {
        
        let request = GithubAccessTokenRequest(clientId: clientId, clientSecret: clientSecret, code: code)
        let accessToken: AccessToken = try await apiClient.request(request)
        
        return accessToken
    }

    func login() async throws {
        let code = await signIn()
        _ = try await createAccessToken(clientId: "de8132a20056a5f3ad7b",
                                clientSecret: "964e3cebf6c92c6a3a9bd185a54523c9163d06d3",
                                code: code ?? "")
    }
}
