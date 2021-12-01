//
//  expressionStack.swift
//  Calculator
//
//  Created by 1 on 2021/12/01.
//

import UIKit

class ExpressionStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(expressionLabels arrangedSubviews: [UIView]) {
        super.init(frame: CGRect.zero)
        self.axis = .horizontal
        self.alignment = .firstBaseline
        self.spacing = 5
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
