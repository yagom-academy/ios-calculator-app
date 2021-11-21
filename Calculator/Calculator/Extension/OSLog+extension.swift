//
//  OSLog+extension.swift
//  Calculator
//
//  Created by Ari on 2021/11/21.
//

import OSLog

extension OSLog {
    private static var subsystem = Bundle.main.bundleIdentifier!
    static let error = OSLog(subsystem: subsystem, category: "Error")
}
