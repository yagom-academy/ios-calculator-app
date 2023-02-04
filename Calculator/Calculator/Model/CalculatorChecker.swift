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
}
