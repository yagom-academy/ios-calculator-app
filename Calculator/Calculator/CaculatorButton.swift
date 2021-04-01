//
//  CaculatorButton.swift
//  Calculator
//
//  Created by 천수현 on 2021/04/01.
//

import UIKit

@IBDesignable
class CaculatorButton: UIButton {
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        layer.cornerRadius = rect.height / 2
        clipsToBounds = true
    }
}
