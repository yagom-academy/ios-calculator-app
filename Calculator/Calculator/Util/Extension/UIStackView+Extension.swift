//
//  UIStackView+Extension.swift
//  Calculator
//
//  Created by Lingo on 2022/03/23.
//

import UIKit

extension UIStackView {
  
  static func create(type: String?, operand: String?) -> UIStackView {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.distribution = .fill
    stackView.alignment = .fill
    stackView.spacing = 8
    
    let operatorLabel = UILabel()
    operatorLabel.font = .preferredFont(forTextStyle: .title3)
    operatorLabel.textColor = .white
    operatorLabel.text = type
    
    let operandLabel = UILabel()
    operandLabel.font = .preferredFont(forTextStyle: .title3)
    operandLabel.textColor = .white
    operandLabel.text = operand
    
    stackView.addArrangedSubview(operatorLabel)
    stackView.addArrangedSubview(operandLabel)
    return stackView
  }
}
