//
//  Protocols.swift
//  Calculator
//
//  Created by 천수현 on 2021/03/23.
//
import Foundation
protocol Computable {
    func add<T: BinaryFloatingPoint>(firstNumber: T, secondNumber: T) -> T
    func subtract<T: BinaryFloatingPoint>(firstNumber: T, secondNumber: T) -> T
}

extension Computable {
    func add<T: BinaryFloatingPoint>(firstNumber: T, secondNumber: T) -> T {
        let result = firstNumber + secondNumber
        return T(round(result * 1e9) / 1e9)
    }
    
    func subtract<T: BinaryFloatingPoint>(firstNumber: T, secondNumber: T) -> T {
        let result = firstNumber - secondNumber
        return T(round(result * 1e9) / 1e9)
    }
}

protocol Calculator: Computable {
    func reset()
}
