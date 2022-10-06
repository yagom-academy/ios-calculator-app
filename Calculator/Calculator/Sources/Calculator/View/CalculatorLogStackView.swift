//
//  CalculatorLogStackView.swift
//  Created by 미니
//

import UIKit

protocol CalculatorLogDelegate: AnyObject {
    func willShowLogStackView(stackView: UIStackView, operatorLabel: UILabel, operandLabel: UILabel)
}

final class CalculatorLogStackView: UIStackView {
    private let operatorLabel = UILabel()
    private let operandLabel = UILabel()
    
    weak var delegate: CalculatorLogDelegate?
    
    func configureStackView() {
        spacing = 8
        distribution = .fill
        axis = .horizontal
        alignment = .fill
        
        delegate?.willShowLogStackView(stackView: self, operatorLabel: operatorLabel, operandLabel: operandLabel)
        
        [
            operatorLabel,
            operandLabel
        ].forEach {
            $0.textColor = .white
            addArrangedSubview($0)
        }
    }
}
