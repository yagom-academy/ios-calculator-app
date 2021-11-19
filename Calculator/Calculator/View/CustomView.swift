//
//  CustomView.swift
//  Calculator
//
//  Created by 이호영 on 2021/11/18.
//

import UIKit

class NumberCompositionLabel: UILabel {
    override var text: String? {
        didSet {
            CurrentLabelValue.shared.operand = text ?? "0"
        }
    }
}

class ExpressionStackView: UIStackView {
    
    var signLabel: ExpressionLabel = {
        let label = ExpressionLabel()
        
        return label
    }()
    
    var numberLabel: ExpressionLabel = {
        let label = ExpressionLabel()
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    private func commonInit() {
        self.addArrangedSubview(signLabel)
        self.addArrangedSubview(numberLabel)
    }
    
}

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
