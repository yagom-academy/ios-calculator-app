//
//  Protocols.swift
//  Calculator
//
//  Created by 천수현 on 2021/03/23.
//
import Foundation
protocol Computable {
    func add(firstNumber: Double, secondNumber: Double) -> Double
    func subtract(firstNumber: Double, secondNumber: Double) -> Double
}

extension Computable {
    func add(firstNumber: Double, secondNumber: Double) -> Double {
        let result = firstNumber + secondNumber
        return Double(round(result * 1e9) / 1e9)
    }
    
    func subtract(firstNumber: Double, secondNumber: Double) -> Double {
        let result = firstNumber - secondNumber
        return Double(round(result * 1e9) / 1e9)
    }
}

protocol Calculator: Computable {
    func reset()
}
