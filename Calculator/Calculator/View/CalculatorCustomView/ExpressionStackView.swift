//
//  ExpressionStackView.swift
//  Calculator
//
//  Created by 이호영 on 2021/11/19.
//

import UIKit

class ExpressionStackView: UIStackView {
    
    // MARK: property
    
    var signLabel: ExpressionLabel = {
        let label = ExpressionLabel()
        
        return label
    }()
    
    var numberLabel: ExpressionLabel = {
        let label = ExpressionLabel()
        
        return label
    }()
    
    // MARK: init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
}

// MARK: - private method

extension ExpressionStackView {
    private func commonInit() {
        self.addArrangedSubview(signLabel)
        self.addArrangedSubview(numberLabel)
        
        setConstraint()
    }
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            signLabel.trailingAnchor.constraint(equalTo: numberLabel.leadingAnchor, constant: -10)
        ])
    }
}
