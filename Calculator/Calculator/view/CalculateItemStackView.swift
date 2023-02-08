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
    
    func removeAllSubviews() {
        self.subviews.forEach { $0.removeFromSuperview() }
    }
    
    func add(_ currentItem: CurrentItem) {
        guard let subview = generateStackView(about: currentItem) else { return }
        
        add(subview, to: self)
        calculateItemScrollView.didAddSubview(subview)
    }
    
    private func generateStackView(about currentItem: CurrentItem) -> UIStackView? {
        let operand = UILabel()
        operand.text = numberFormatter.convertToDecimal(from: currentItem.operand)
        operand.textColor = UIColor.white
        operand.font = UIFont.preferredFont(forTextStyle: .title3)
        
        let `operator` = UILabel()
        `operator`.text = currentItem.operator
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
