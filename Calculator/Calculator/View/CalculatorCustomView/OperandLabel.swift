//
//  OperandLabel.swift
//  Calculator
//
//  Created by 이호영 on 2021/11/19.
//

import UIKit

class OperandLabel: UILabel {
    
    // MARK: property
    
    let defaultValue = "0"
    let emptyValue = ""
    
    // MARK: override property
    
    override var text: String? {
        didSet {
            CurrentLabelValue.shared.operand = text ?? "0"
        }
    }
}
