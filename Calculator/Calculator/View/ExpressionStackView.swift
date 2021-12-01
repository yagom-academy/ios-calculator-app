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
    
    init(arrangedSubviews views: [UIView]) {
        super.init(frame: CGRect.zero)
        self.axis = .horizontal
        self.alignment = .firstBaseline
        self.spacing = 5
        
        views.forEach { (view: UIView) in
            addArrangedSubview(view)
        }
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
