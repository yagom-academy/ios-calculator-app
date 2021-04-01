//
//  CaculatorButton.swift
//  Calculator
//
//  Created by 천수현 on 2021/04/01.
//

import UIKit

enum CustomButtonType {
    case numberButton
    case operatorButton
    case functionButton
}

@IBDesignable
class CaculatorButton: UIButton {
    var customButtonType = CustomButtonType.numberButton
    var isOn: Bool = false
    
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = rect.height / 2
        clipsToBounds = true
        
        switch customButtonType {
        case .numberButton:
            layer.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        case .functionButton:
            layer.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        case .operatorButton:
            layer.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        
    }
}
