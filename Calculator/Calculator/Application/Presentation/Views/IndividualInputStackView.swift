//
//  IndivisualInputStackView.swift
//  Calculator
//
//  Created by Gordon Choi on 2022/05/28.
//

import UIKit

class IndividualInputStackView: UIStackView {
    private let operatorLabel = UILabel()
    private let operandLabel = UILabel()
    
    init(operatorData: String, operandData: String) {
        operatorLabel.text = operatorData
        operandLabel.text = operandData.formatAsNumber()
        
        super.init(frame: CGRect(x: 267, y: 0, width: 115, height: 20.5))
        
        setupStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStackView() {
        operatorLabel.textColor = .white
        operandLabel.textColor = .white
        self.addArrangedSubview(operatorLabel)
        self.addArrangedSubview(operandLabel)
        
        self.axis = .horizontal
        self.alignment = .fill
        self.spacing = 8
    }
}
