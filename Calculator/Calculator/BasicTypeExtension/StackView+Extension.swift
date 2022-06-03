//
//  StackView+Extension.swift
//  Calculator
//
//  Created by 이예은 on 2022/06/03.
//

import UIKit

extension UIStackView {
    func canAddOperand(_ label: String) -> Bool {
        if self.arrangedSubviews.count > 0 && label == CalcAccessory.empty {
            return false
        }
        
        return true
    }
}
