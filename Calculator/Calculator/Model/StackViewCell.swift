//
//  StackViewCell.swift
//  Calculator
//
//  Created by 이정민 on 2022/09/29.
//

import UIKit

struct StackViewCell {
    private let stackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        
        return stackView
    }()
    
    private let operatorLabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        
        return label
    }()
    
    private let operandLabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        
        return label
    }()
    
    init(operand: String, `operator`: String) {
        operatorLabel.text = `operator`
        operandLabel.text = operand
    }
    
    func generateStackView() -> UIStackView {
        stackView.addArrangedSubview(operatorLabel)
        stackView.addArrangedSubview(operandLabel)
        
        return stackView
    }
}
