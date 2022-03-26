//
//  UIStackView+Extension.swift
//  Calculator
//
//  Created by Lingo on 2022/03/23.
//

import UIKit

extension UIStackView {
  
  convenience init(frame: CGRect = .zero, type: String?, operand: String?) {
    self.init(frame: frame)
    self.distribution = .fill
    self.alignment = .fill
    self.axis = .horizontal
    self.spacing = 8
    
    let operatorLabel = UILabel()
    operatorLabel.font = .preferredFont(forTextStyle: .title3)
    operatorLabel.textColor = .white
    operatorLabel.text = type
    
    let operandLabel = UILabel()
    operandLabel.font = .preferredFont(forTextStyle: .title3)
    operandLabel.textColor = .white
    operandLabel.text = operand
    
    self.addArrangedSubview(operatorLabel)
    self.addArrangedSubview(operandLabel)
  }
}
