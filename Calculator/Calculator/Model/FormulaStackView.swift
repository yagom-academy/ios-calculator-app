//  FormulaStackView.swift
//  Created by zhilly and Gundy on 2022/10/04.

import UIKit

final class FormulaStackView: UIStackView {
    func configure(operatorText: String?, operandText: String?) {
        let operatorLabel: FormulaLabel = .init()
        let operandLabel: FormulaLabel = .init()
        operatorLabel.configure(text: operatorText)
        operandLabel.configure(text: operandText)
        addArrangedSubview(operatorLabel)
        addArrangedSubview(operandLabel)
        spacing = 8
    }
}
