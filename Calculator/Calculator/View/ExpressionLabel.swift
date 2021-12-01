//
//  expressionLabel.swift
//  Calculator
//
//  Created by 1 on 2021/12/01.
//

import UIKit

class ExpressionLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    init(text: String) {
        super.init(frame: CGRect.zero)
        self.text = text
        self.textColor = .white
        self.font = UIFont(name: "", size: 25)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
