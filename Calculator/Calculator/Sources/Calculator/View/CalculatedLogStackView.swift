//
//  CalculatedRecordStackView.swift
//  Calculator
//
//  Created by 이경민 on 2022/09/29.
//

import UIKit

final class CalculatedLogStackView: UIStackView {
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
    
    init(operatorValue: String, operandValue: String) {
        operatorLabel.text = operatorValue
        operandLabel.text = operandValue
        
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
