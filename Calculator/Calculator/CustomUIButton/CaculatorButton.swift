//
//  CaculatorButton.swift
//  Calculator
//
//  Created by Neph on 2021/04/01.
//

import UIKit

@IBDesignable
class CaculatorButton: UIButton {
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = rect.height / 2
        clipsToBounds = true
    }
}
