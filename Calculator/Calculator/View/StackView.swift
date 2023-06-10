//
//  StackView.swift
//  Calculator
//
//  Created by Daehoon Lee on 2023/06/10.
//

import UIKit

class StackView: UIStackView {
    func configure(operator currentOperator: UILabel, operand currentOperand: UILabel) -> UIStackView {
        let recordedOperatorLabel: UILabel = configureItem(with: currentOperator)
        let recordedOperandLabel: UILabel = configureItem(with: currentOperand)
        let content: UIStackView = configureContent(item: recordedOperatorLabel, recordedOperandLabel)
        
        return content
    }
        
    private func configureContent(item formula: UILabel...) -> UIStackView {
        let content: UIStackView = UIStackView()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.axis = .horizontal
        content.alignment = .fill
        content.distribution = .equalSpacing
        content.spacing = 8
        formula.forEach { content.addArrangedSubview($0) }
        
        return content
    }

    private func configureItem(with label: UILabel) -> UILabel {
        let recordedLabel: UILabel = UILabel()
        recordedLabel.font = .preferredFont(forTextStyle: .title3)
        recordedLabel.text = label.text
        recordedLabel.textColor = .white
        
        return recordedLabel
    }
}
