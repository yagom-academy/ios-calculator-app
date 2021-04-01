//
//  OperatorBUtton.swift
//  Calculator
//
//  Created by 천수현 on 2021/04/01.
//

import UIKit

class OperatorButton: CaculatorButton {
    var isOn: Bool = false
    var precedence: Int = 0
   
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    

}
