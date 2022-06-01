//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by Derrick kim on 2022/05/30.
//

import UIKit

final class CalculatorStackView: UIStackView {
    init(operatorText: String?, operandText: String?) {
        super.init(frame: .null)
        setLabels(with: operatorText, and: operandText)
        setDefaultAttribute()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CalculatorStackView {
    func setLabels(with operatorText: String?, and operandText: String?) {
        let operatorLabel = createDefaultLabel(with: operatorText)
        let operandLabel = createDefaultLabel(with: operandText)
        self.addArrangedSubview(operatorLabel)
        self.addArrangedSubview(operandLabel)
    }
    
    func setDefaultAttribute() {
        self.spacing = 8
        self.alignment = .fill
        self.distribution = .fill
        self.axis = .horizontal
    }
    
    func createDefaultLabel(with text: String?) -> UILabel {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = UIColor.white
        label.textAlignment = .right
        label.text = text
        return label
    }
}
