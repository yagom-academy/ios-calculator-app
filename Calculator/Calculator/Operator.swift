//
//  Operator.swift
//  Calculator
//
//  Created by 송종환 on 2023/01/26.
//

import Foundation

enum Operator: Character, CaseIterable {
    case add = "+"
    case subtract = "-"
    case divide = "*"
    case multiply = "/"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        
        return 1 //  = 버튼을 누르면 입력된 연산을 한 번에 수행합니다
    }
    
    func add(lhs: Double, rhs: Double) -> Double {
       return lhs + rhs
    }
    
    func subtract(lhs: Double, rhs: Double) -> Double {
       return lhs - rhs
    }
    
    func divide(lhs: Double, rhs: Double) -> Double {
       return lhs / rhs
    }
    
    func multiply(lhs: Double, rhs: Double) -> Double {
       return lhs * rhs
    }
}
