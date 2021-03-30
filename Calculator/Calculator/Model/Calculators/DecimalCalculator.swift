//
//  Calculator.swift
//  Calculator
//
//  Created by 김찬우 on 2021/03/30.
//

import Foundation


struct DecimalCalculator: Addable, Subtractable, TypeConvertible {
    typealias T = Double
    var stack = Stack<Double>()
    var userInputNumber: Double = 0
    var userInputOperator: Operator = .addition
    
    func divide(_ operatedNumber: Double, by operatingNumber: Double) -> Double {
        return operatedNumber / operatingNumber
    }
    
    func multiply(_ operatedNumber: Double, by operatingNumber: Double) -> Double {
        return operatedNumber * operatingNumber
    }
    
    func inputAndConvertType() -> Double {
        guard let number = readLine() else { return 0 }
        guard let userInputNumber = Double(number) else { return 0 }
        return userInputNumber
    }
    
    mutating func eachOperator() {
        switch userInputOperator {
        case .addition:
            add(userInputNumber, and: <#T##Numeric#>)
        case .subtraction: <#code#>
        case .multiplication: <#code#>
        case .division: <#code#>
        default:
        }
    }
}

// 헤헤 만만한거 제가 다 했지롱
// 기능이 생각 안난다면 명세서로
