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
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
