//
//   CircleButton.swift
//  Calculator
//
//  Created by mene on 28/9/2022.
//

import UIKit

@IBDesignable
final class CircleButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
}
