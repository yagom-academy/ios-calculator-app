//
//  FunctionButton.swift
//  Calculator
//
//  Created by 천수현 on 2021/04/01.
//

import UIKit

class FunctionButton: CaculatorButton {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
   
}
