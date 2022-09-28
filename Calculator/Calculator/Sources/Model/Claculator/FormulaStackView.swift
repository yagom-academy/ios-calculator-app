//
//  FormulaStackView.swift
//  Calculator
//
//  Created by Gundy on 2022/09/29.
//

import UIKit

final class FormulaStackView: UIStackView {
    func configure(operatorText: String?, operandText: String?) {
        let operatorLabel: FormulaLabel = .init()
        let operandLabel: FormulaLabel = .init()
        operatorLabel.configure(text: operatorText)
        operandLabel.configure(text: operandText)
        addArrangedSubview(operatorLabel)
        addArrangedSubview(operandLabel)
        spacing = CalculatorConstants.Number.formulaStackViewSpacing
    }
}
