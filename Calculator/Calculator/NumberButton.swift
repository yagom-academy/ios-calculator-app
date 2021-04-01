//
//  NumberButton.swift
//  Calculator
//
//  Created by 천수현 on 2021/04/01.
//

import UIKit

@IBDesignable
class NumberButton: CaculatorButton {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        super.draw(rect)
        layer.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }

}
