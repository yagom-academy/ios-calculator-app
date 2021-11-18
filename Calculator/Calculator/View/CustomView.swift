//
//  CustomView.swift
//  Calculator
//
//  Created by 이호영 on 2021/11/18.
//

import UIKit

class ExpressionLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    private func commonInit() {
        self.textColor = .white
    }
    
}
