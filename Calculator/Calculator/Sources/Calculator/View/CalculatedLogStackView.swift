//
//  CalculatedRecordStackView.swift
//  Calculator
//
//  Created by 미니 on 2022/09/29.
//

import UIKit

final class CalculatorLogStackView: UIStackView {
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
    
    init(operatorText: String, operandText: String?) {
        operatorLabel.text = operatorText
        operandLabel.text = operandText
        
        super.init(arrangedSubviews: [operatorLabel, operandLabel])
        self.configureStackView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configureStackView() {
        spacing = 8
        distribution = .fill
        axis = .horizontal
        alignment = .fill
    }
}
