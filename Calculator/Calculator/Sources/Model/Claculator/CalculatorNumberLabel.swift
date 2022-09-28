//
//  CalculatorNumberLabel.swift
//  Calculator
//
//  Created by Gundy on 2022/09/27.
//

import UIKit

final class CalculatorNumberLabel: UILabel {
    var isZero: Bool {
        if self.text == CalculatorConstants.Text.zero {
            return true
        } else {
            return false
        }
    }
    
    func switchSign() {
        guard let text = self.text else {
            return
        }
        if text.first == CalculatorConstants.Text.negativeSign {
            self.text?.removeFirst()
        } else {
            self.text = String(CalculatorConstants.Text.negativeSign) + text
        }
    }
    
    func resetToZero() {
        self.text = CalculatorConstants.Text.zero
    }
}
