//
//  CalculatorManager.swift
//  Calculator
//
//  Created by 이승재 on 2021/11/15.
//

import Foundation

struct CalculatorManager {
    var isCalculating : Bool
    private let numberFormatter = NumberFormatter()

    init(isCalculating: Bool){
        self.isCalculating = isCalculating
    }
    
    func format(of number: String) -> String {
        return ""
    }
}
