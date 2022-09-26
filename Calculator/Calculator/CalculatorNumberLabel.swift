//
//  CalculatorNumberLabel.swift
//  Calculator
//
//  Created by Gundy on 2022/09/27.
//

import UIKit

class CalculatorNumberLabel: UILabel {
    var isResultOfFormula: Bool = false
    
    func switchSign() {
        guard let text = self.text else {
            return
        }
        if text.first == "-" {
            self.text?.removeFirst()
        } else {
            self.text = "-" + text
        }
    }
    
    func resetToZero() {
        self.text = CalculatorText.zero
    }
}
