//
//  OSLog+extension.swift
//  Calculator
//
//  Created by Ari on 2021/11/24.
//

import Foundation
import OSLog

extension OSLog {
    private static var subsystem = Bundle.main.bundleIdentifier ?? "Calculator"
    static let error = OSLog(subsystem: subsystem, category: "Error")
}
