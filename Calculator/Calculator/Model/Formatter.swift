//
//  Formatter.swift
//  Calculator
//
//  Created by 이차민 on 2021/12/05.
//

import Foundation

class Formatter: NumberFormatter {
    override init() {
        super.init()
        self.numberStyle = .decimal
        self.usesSignificantDigits = true
        self.maximumSignificantDigits = 20
        self.roundingMode = .halfUp
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
