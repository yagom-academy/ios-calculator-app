//
//  FormulaStackView.swift
//  Calculator
//
//  Created by Seul Mac on 2021/11/23.
//

import UIKit

class FormulaStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        initializeLabel()
    }
    
    func initializeLabel() {
        axis = .horizontal
        alignment = .fill
        distribution = .fill
        spacing = 8
    }
}
