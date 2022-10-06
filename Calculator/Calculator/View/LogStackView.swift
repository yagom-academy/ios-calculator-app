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
    
    convenience init(operand: String, arithmeticOperator: String) {
        self.init(frame: .zero)
        operandLabel.text = operand
        operatorLabel.text = arithmeticOperator
        [operatorLabel, operandLabel].forEach(addArrangedSubview(_:))
        addSpacing()
    }
    
    func addSpacing() {
        self.spacing = CalculatorConstant.logStackViewSpacing
    }
}
