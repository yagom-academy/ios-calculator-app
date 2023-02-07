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
    private let viewGenerator = ViewGenerator()
    
    func removeAllSubviews() {
        self.subviews.forEach { $0.removeFromSuperview() }
    }
    
    func add(_ currentItem: CurrentItem) {
        guard let subview = viewGenerator.generateStackView(about: currentItem) else { return }
        
        self.addArrangedSubview(subview)
        calculateItemScrollView.didAddSubview(subview)
    }
}
