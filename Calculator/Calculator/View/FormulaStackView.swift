//
//  FormulaStackView.swift
//  Calculator
//
//  Created by 천승현 on 2023/02/04.
//

import UIKit

class FormulaStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .horizontal
        self.distribution = .fill
        self.alignment = .fill
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
