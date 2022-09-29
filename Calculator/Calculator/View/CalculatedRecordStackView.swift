//
//  CalculatedRecordStackView.swift
//  Calculator
//
//  Created by 이경민 on 2022/09/29.
//

import UIKit

class CalculatedRecordStackView: UIStackView {
    private let operatorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title3)
        return label
    }()
    
    private let operandLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title3)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(_ inputedOperator: String, _ inputedOperand: String) {
        operatorLabel.text = inputedOperator
        operandLabel.text = inputedOperand
        
        super.init(arrangedSubviews: [operatorLabel, operandLabel])
        setUpStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpStackView() {
        spacing = 8
        distribution = .fill
        axis = .horizontal
        alignment = .fill
    }
}
