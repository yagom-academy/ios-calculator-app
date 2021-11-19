//
//  OperatorLabel.swift
//  Calculator
//
//  Created by 이호영 on 2021/11/19.
//

import UIKit

class OperatorLabel: UILabel {
    
    // MARK: property
    
    let defaultValue = ""
    
    // MARK: override property
    
    override var text: String? {
        didSet {
            CurrentLabelValue.shared.operator = text ?? ""
        }
    }
}
