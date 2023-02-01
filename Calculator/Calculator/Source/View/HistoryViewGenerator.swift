//
//  StackViewGenerator.swift
//  Calculator
//
//  Created by Harry on 2023/02/01.
//

import UIKit

enum HistoryViewGenerator {
    private static func generateLabel(text: String) -> UILabel {
        let label: UILabel = UILabel()
        
        //label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.text = text
        
        return label
    }
    
    static func generateStackView(`operator`: String, operand: String) -> UIStackView {
        let operatorLabel = generateLabel(text: `operator`)
        let operandLabel = generateLabel(text: operand)
        let horizontalStackView: UIStackView = UIStackView()
        
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 8
        horizontalStackView.alignment = .fill
        horizontalStackView.distribution = .fill
        horizontalStackView.addArrangedSubview(operatorLabel)
        horizontalStackView.addArrangedSubview(operandLabel)
        
        return horizontalStackView
    }
}
