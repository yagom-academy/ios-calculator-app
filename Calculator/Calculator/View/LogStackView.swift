//
//  LogStackView.swift
//  Calculator
//
//  Created by 이태영 on 2022/10/01.
//

import UIKit

final class LogStackView: UIStackView {
    private let operandLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    private let operatorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    init(operand: String, arithmeticOperator: String) {
        operandLabel.text = operand
        operatorLabel.text = arithmeticOperator
        super.init(arrangedSubviews: [operatorLabel, operandLabel])
        addSpacing()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func addSpacing() {
        self.spacing = CalculatorConstant.logStackViewSpacing
    }
}
