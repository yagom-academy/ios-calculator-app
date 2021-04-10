//
//  AddableProtocol.swift
//  Calculator
//
//  Created by 김찬우 on 2021/03/26.
//

import Foundation

protocol Addable {
    associatedtype T: Numeric
    mutating func add(_ operatedNumber: T, and operatingNumber: T) -> T
}

extension Addable {
    mutating func add(_ operatedNumber: T, and operatingNumber: T) -> T {
        return operatedNumber + operatingNumber
    }
}
