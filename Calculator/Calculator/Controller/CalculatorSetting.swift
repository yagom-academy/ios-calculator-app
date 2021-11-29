//
//  CalculatorSetting.swift
//  Calculator
//
//  Created by 예거 on 2021/11/28.
//

import UIKit

extension Character {
    static let whiteSpace: Character = " "
}

extension String {
    static let empty: String = ""
    static let zero: String = "0"
    static let decimalPoint: String = "."
    static let decimalComma: String = ","
    static let negativeSign: String = "-"
}

enum CalculatorSetting {
    static func adjustLabelAttributes() -> UILabel {
        let singleLabel = UILabel()
        singleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        singleLabel.textColor = .white
        singleLabel.adjustsFontSizeToFitWidth = true
        return singleLabel
    }
    
    static func scrollToBottom(on scrollView: UIScrollView) {
        scrollView.layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0,
                                   y: scrollView.contentSize.height
                                      - scrollView.bounds.size.height
                                      + scrollView.contentInset.bottom)
        if bottomOffset.y > 0 {
            scrollView.setContentOffset(bottomOffset, animated: false)
        }
        
        scrollView.flashScrollIndicators()
    }
    
    static func formatNumber(_ input: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumIntegerDigits = 20
        numberFormatter.maximumFractionDigits = 20
        numberFormatter.roundingMode = .halfUp
        return numberFormatter.string(for: input) ?? String.empty
    }
    
    static func occurHapticFeedback() {
        let hapticGenerator = UISelectionFeedbackGenerator()
        hapticGenerator.selectionChanged()
    }
}
