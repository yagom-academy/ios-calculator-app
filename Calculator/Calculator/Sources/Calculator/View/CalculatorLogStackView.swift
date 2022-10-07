//
//  CalculatorLogStackView.swift
//  Created by 미니
//

import UIKit

final class CalculatorLogStackView: UIStackView {
    private let operatorLabel = UILabel()
    private let operandLabel = UILabel()
    
    convenience init(operatorText: String, operandText: String?) {
        self.init(frame: .zero)
        operatorLabel.text = operatorText
        operandLabel.text = operandText
        
        configureStackView()
    }
    
    private func configureStackView() {
        spacing = 8
        distribution = .fill
        axis = .horizontal
        alignment = .fill
        
        [
            operatorLabel,
            operandLabel
        ].forEach {
            $0.textColor = .white
            addArrangedSubview($0)
        }
    }
}
