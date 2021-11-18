//
//  Operands.swift
//  Calculator
//
//  Created by 박병호 on 2021/11/18.
//

import Foundation

enum Operands: String {
    case dot = "."
    case zero = "0"
    case zerozero = "00"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
}

extension Operands: CustomStringConvertible {
    var description: String {
        return self.rawValue
    }
}
