//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by Derrick kim on 2022/05/30.
//

import UIKit

final class CalculatorViewModel {
    func addStackView(_ stackView: UIStackView?, operatorText: String?, operandText: String?) {
        guard let stackView = stackView,
              let operatorText = operatorText,
              let operandText = operandText else {
            return
        }

        let newStackView = makeStackView(with: operatorText, and: operandText)
        stackView.addArrangedSubview(newStackView)
    }
}

private extension CalculatorViewModel {
    func makeStackView(with operatorText: String, and operandText: String) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [makeLabel(text: operatorText),
                                                       makeLabel(text: operandText)])
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .horizontal
        return stackView
    }
    
    func makeLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = UIColor.white
        label.textAlignment = .right
        return label
    }
}
