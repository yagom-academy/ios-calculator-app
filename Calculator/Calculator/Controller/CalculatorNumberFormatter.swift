//
//  CalculatorNumberFormatter.swift
//  Calculator
//
//  Created by Seul Mac on 2021/11/24.
//

import Foundation

class CalculatorNumberFormatter: NumberFormatter {
    
    override init() {
        super .init()
        self.numberStyle = .decimal
        self.maximumSignificantDigits = 20
        self.roundingMode = .halfUp
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
