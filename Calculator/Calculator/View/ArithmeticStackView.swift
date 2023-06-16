//
//  ArithmeticStackView.swift
//  Calculator
//
//  Created by Zion & Dasan on 2023/06/15.
//

import UIKit

final class ArithmeticStackView: UIStackView {
    private let operatorLabel = UILabel()
    private let operandLabel = UILabel()
    
    convenience init(_ operatorText: String?, _ operandText: String?) {
        self.init(frame: CGRect.zero)
        
        operatorLabel.text = operatorText
        operandLabel.text = operandText
        
        axis = .horizontal
        spacing = 8
        
        [operatorLabel, operandLabel].forEach {
            settingArithmeticLabels($0)
            addArrangedSubview($0)
        }
    }
    
    private func settingArithmeticLabels(_ label: UILabel) {
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
    }
}
