//
//  UILabel+.swift
//  Calculator
//
//  Created by minsong kim on 2023/06/14.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont = .preferredFont(forTextStyle: .title2), textColor: UIColor = .white) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.textColor = textColor
    }
}
