//
//  CalculatorChecker.swift
//  Calculator
//
//  Created by 천승현 on 2023/02/04.
//

import Foundation

struct CalculatorChecker {
    
    func hasCurrentInput(_ currentText: String) -> Bool {
        return currentText == Sign.empty ? false : true
    }
    
    func hasDot(_ currentText: String) -> Bool {
        return currentText.contains(Sign.dot) ? true : false
    }
    
    // 현재 텍스트를 받아서 empty라면 0.을 리턴하고 empty가아니면 .을리턴한다.
    func appendingDot(_ currentText: String) -> String {
        if currentText == Sign.empty {
            return Sign.zero + Sign.dot
        }
        return currentText + Sign.dot
    }
    
    func isZero(_ input: String) -> Bool {
        return input == Sign.zero ? true : false
    }
    
    func calculate(with expression: String) -> Double {
        return 0.0
    }
}
