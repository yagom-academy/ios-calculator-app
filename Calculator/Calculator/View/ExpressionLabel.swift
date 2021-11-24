//
//  ExpressionLabel.swift
//  Calculator
//
//  Created by 이차민 on 2021/11/19.
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
        self.font = UIFont(name: "Helvetica", size: 24)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
