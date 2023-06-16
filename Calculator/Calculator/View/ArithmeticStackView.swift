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
        
        self.operatorLabel.text = operatorText
        self.operandLabel.text = operandText
        
        [operatorLabel, operandLabel].forEach {
            settingArithmeticLabels($0)
            addArrangedSubview($0)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        axis = .horizontal
        spacing = 8
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func settingArithmeticLabels(_ label: UILabel) {
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
    }
}
