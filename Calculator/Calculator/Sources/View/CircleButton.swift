//
//  Calculator - CircleButton.swift
//  Created by Rhode.
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CircleButton: UIButton {

    override func draw(_ rect: CGRect) {
        layer.cornerRadius = bounds.height / 2
    }
}
