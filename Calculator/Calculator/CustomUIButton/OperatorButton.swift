//
//  OperatorBUtton.swift
//  Calculator
//
//  Created by Neph on 2021/04/01.
//

import UIKit

class OperatorButton: CaculatorButton {
    
    var isOn: Bool = false {
        didSet {
            if self.isOn {
                layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                tintColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
            } else {
                layer.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
                tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
        }
    }
    var operatorType: Operator = Operators.additionForDecimal
   
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
}
