//
//  NumberFormatter.swift
//  Calculator
//
//  Created by 1 on 2021/11/30.
//

import Foundation

class CustomNumberFormatter: NumberFormatter {
    
    override init() {
        super.init()
        self.numberStyle = .decimal
        self.usesSignificantDigits = true
        self.maximumSignificantDigits = 20
        self.roundingMode = .ceiling
    }
    
    required init?(coder: NSCoder) {
        super.init()
    }
}

