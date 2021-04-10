//
//  SubtractableProtocol.swift
//  Calculator
//
//  Created by 김찬우 on 2021/03/26.
//

import Foundation

protocol Subtractable {
    associatedtype T: Numeric
    mutating func subtract(_ operatedNumber: T, and operatingNumber: T) -> T
}

extension Subtractable {
    mutating func subtract(_ operatedNumber: T, and operatingNumber: T) -> T {
        return operatedNumber - operatingNumber
    }
}
