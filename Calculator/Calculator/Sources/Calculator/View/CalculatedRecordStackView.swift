//
//  CalculatedRecordStackView.swift
//  Calculator
//
//  Created by 이경민 on 2022/09/29.
//

import UIKit

protocol RecordStackViewDelegate: AnyObject {
    func sendLabelTexts() -> (operatorValue: String, operand: String)
}

final class CalculatedRecordStackView: UIStackView {
    weak var delegate: RecordStackViewDelegate?
    
    private let operatorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    private let operandLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    func setUpStackView() {
        configureStackView()
        setUpLabels()
        
        [operatorLabel, operandLabel].forEach { addArrangedSubview($0) }
    }
    
    private func configureStackView() {
        spacing = 8
        distribution = .fill
        axis = .horizontal
        alignment = .fill
    }
    
    private func setUpLabels() {
        let labelTexts = delegate?.sendLabelTexts()
        
        operandLabel.text = labelTexts?.operand
        operatorLabel.text = labelTexts?.operatorValue
    }
}
