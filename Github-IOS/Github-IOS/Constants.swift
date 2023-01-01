//
//  Constants.swift
//  Github-IOS
//
//  Created by groo on 19/11/2022.
//

import Foundation
import UIKit

public struct Constants {
    struct API {
        static let baseURL = "http://github.com/"
    }
    
    struct UserDefaults {
        @UserDefault(key: "token", defaultValue: "")
        static var token: String
    }
}

class TestDelegate: NSObject, UICollectionViewDelegate {
    
}
