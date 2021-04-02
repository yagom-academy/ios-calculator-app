//
//  Operand.swift
//  Calculator
//
//  Created by 덕복 on 2021/03/26.
//

import Foundation

protocol Operand: CalculatingElement, CustomStringConvertible {
    associatedtype ValueType
    
    var value: ValueType { get }
    var text: String { get }
    static var zero: Self { get }
    static var max: ValueType { get }
    static var min: ValueType { get }
    
    init?(_ text: String)
    init(_ value: ValueType)
}

