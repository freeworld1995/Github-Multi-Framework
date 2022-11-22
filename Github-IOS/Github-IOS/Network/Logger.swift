//
//  Logger.swift
//  Github-IOS
//
//  Created by groo on 20/11/2022.
//

import Foundation
import OSLog

public enum LogType {
    case debug
    case network
}

protocol Logging {
    func debug(_ text: String)
    func network(_ text: String)
}

extension OSLog {
    private static var subsystem = Bundle.main.bundleIdentifier!
    
    static let debug = OSLog(subsystem: subsystem, category: "debug")
    static let network = OSLog(subsystem: subsystem, category: "network")
}

public class Logger: Logging {
    public static let shared = Logger()
    
    func debug(_ text: String) {
        os_log(.debug, "🪲🪲🪲 Debug: %@ ", text)
    }
    
    func network(_ text: String) {
        os_log(.debug, "🌐🌐🌐 Network: %@ ", text)
    }
}
