//
//  CircleButton.swift
//  Calculator
//
//  Created by Jinah Park on 2023/01/31.
//

import UIKit

class CircleButton: UIButton {

    override func draw(_ rect: CGRect) {
        layer.cornerRadius = bounds.height / 2
    }
}
