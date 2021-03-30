//
//  Operand.swift
//  Calculator
//
//  Created by 덕복 on 2021/03/26.
//

import Foundation

protocol Operand: CalculatingElement, CustomStringConvertible {
    static var zero: Self { get }
    static var maxByDigits: Int { get }
    
    init?(_ text: String)
}

extension Double: Operand {
    static let maxByDigits: Int = Int(pow(10, Double(Constant.numberOfDigits))) - 1

    func ceiledByDigits() -> Self {
        let number: Int = Constant.numberOfDigits - String(Int(self)).count
        return ceil(self * pow(10, Double(number))) / pow(10, Double(number))
    }
}
