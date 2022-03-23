//
//  ExpressionStackView.swift
//  Calculator
//
//  Created by 조민호 on 2022/03/23.
//

import UIKit

final class ExpressionStackView: UIStackView {
    private var operand: String = Constant.blank
    private var `operator`: String = Constant.blank
    
    private lazy var operatorLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .white
        label.text = `operator`
        return label
    }()
    
    private lazy var operandLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .white
        label.text = operand
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    convenience init(`operator`: String, operand: String) {
        self.init()
        self.`operator` = `operator`
        self.operand = operand
        
        self.addArrangedSubview(operatorLabel)
        self.addArrangedSubview(operandLabel)
    }
    
    convenience init(operand: String) {
        self.init()
        self.operand = operand
        
        self.addArrangedSubview(operandLabel)
    }
    
    private func configure() {
        self.axis = .horizontal
        self.alignment = .fill
        self.distribution = .fill
        self.spacing = 8
    }
}
