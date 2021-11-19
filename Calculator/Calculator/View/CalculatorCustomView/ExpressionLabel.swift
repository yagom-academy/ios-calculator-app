//
//  ExpressionLabel.swift
//  Calculator
//
//  Created by 이호영 on 2021/11/19.
//

import UIKit

class ExpressionLabel: UILabel {
    
    // MARK: init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
}

// MARK: - private method

extension ExpressionLabel {
    private func commonInit() {
        self.textColor = .white
    }
}
