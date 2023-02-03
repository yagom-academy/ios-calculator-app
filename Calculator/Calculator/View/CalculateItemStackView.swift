//
//  CalculateItemStackView.swift
//  Calculator
//
//  Created by Rowan on 2023/02/02.
//

import UIKit

final class CalculateItemStackView: UIStackView {
    @IBOutlet private weak var calculateItemScrollView: UIScrollView!
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operandLabel: UILabel!
    
    private let numberFormatter = NumberFormatter(numberStyle: .decimal,
                                          roundingMode: .halfUp,
                                          usesSignificantDigits: true,
                                          maximumSignificantDigits: 20)
    private var currentOperand: String {
        return operandLabel.text ?? Sign.zero
    }
    private var currentOperator: String {
        return operatorLabel.text ?? Sign.empty
    }
    
    func removeAllSubviews() {
        self.subviews.forEach { $0.removeFromSuperview() }
    }
    
    func addCurrentItem(`operator`: String, operand: String) {
        guard let subview = generateCurrentItemStackView(operatorText: `operator`, operandText: operand) else { return }
        
        add(subview, to: self)
        calculateItemScrollView.didAddSubview(subview)
    }
    
    private func generateCurrentItemStackView(operatorText: String, operandText: String) -> UIStackView? {
        let operand = UILabel()
        operand.text = numberFormatter.convertToDecimal(from: operandText)
        operand.textColor = UIColor.white
        operand.font = UIFont.preferredFont(forTextStyle: .title3)
        
        let `operator` = UILabel()
        `operator`.text = operatorText
        `operator`.textColor = UIColor.white
        `operator`.font = UIFont.preferredFont(forTextStyle: .title3)
        
        let result = UIStackView()
        result.addArrangedSubview(`operator`)
        result.addArrangedSubview(operand)
        result.spacing = 8
        
        return result
    }
    
    private func add(_ subview: UIStackView, to superview: UIStackView) {
        superview.addArrangedSubview(subview)
    }
}
