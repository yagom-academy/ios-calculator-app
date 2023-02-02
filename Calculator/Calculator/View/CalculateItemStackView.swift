//
//  CalculateItemStackView.swift
//  Calculator
//
//  Created by Rowan on 2023/02/02.
//

import UIKit

final class CalculateItemStackView: UIStackView {
    @IBOutlet weak var calculateItemScrollView: UIScrollView!
    
    func removeAllSubviews() {
        self.subviews.forEach { $0.removeFromSuperview() }
    }
    
    func addCurrentItem() {
        guard let subview = generateCurrentItemStackView() else { return }
        
        add(subview, to: self)
        calculateItemScrollView.didAddSubview(subview)
    }
    
    private func generateCurrentItemStackView() -> UIStackView? {
        let operand = UILabel()
        operand.text = convertToDecimal(from: currentOperand)
        operand.textColor = UIColor.white
        operand.font = UIFont.preferredFont(forTextStyle: .title3)
        
        let `operator` = UILabel()
        `operator`.text = currentOperator
        `operator`.textColor = UIColor.white
        `operator`.font = UIFont.preferredFont(forTextStyle: .title3)
        
        let result = UIStackView()
        result.addArrangedSubview(`operator`)
        result.addArrangedSubview(operand)
        result.axis = .horizontal
        result.spacing = 8
        result.alignment = .fill
        result.distribution = .fill
        
        addToCurrentInput(about: `operator`, and: operand)
        
        return result
    }
    
    private func add(_ subview: UIStackView, to superview: UIStackView) {
        let calculateItem = subview
        superview.addArrangedSubview(calculateItem)
    }
    
    private func addToCurrentInput(about `operator`: UILabel, and operand: UILabel) {
        guard let input = makeInput(from: `operator`, and: operand) else { return }
        currentInput += input
    }
    
    private func makeInput(from `operator`: UILabel, and operand: UILabel) -> String? {
        guard let operatorText = `operator`.text,
              let operandText = operand.text,
              let convertedOperandText = convertToNone(from: operandText) else { return nil }
        
        let result = operatorText + Sign.space + convertedOperandText + Sign.space
        
        return result
    }
    
    private func convertToNone(from decimal: String) -> String? {
        let comma = Character(Sign.comma)
        let noneStyle = decimal.split(with: comma).joined()
        
        return noneStyle
    }
}
