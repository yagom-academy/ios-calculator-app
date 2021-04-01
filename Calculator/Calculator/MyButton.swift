//
//  MyButton.swift
//  Calculator
//
//  Created by kio on 2021/04/01.
//

import UIKit

@IBDesignable
class MyButton: UIButton {

    override func draw(_ rect: CGRect) {
        layer.cornerRadius = rect.height / 2
        clipsToBounds = true
        // 글씨가 안짤리게 하는것
        
    }
}
