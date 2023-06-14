//
//  UIStackView+.swift
//  Calculator
//
//  Created by minsong kim on 2023/06/14.
//

import UIKit

extension UIStackView {
    convenience init(firstLabel: UILabel, secondLabel: UILabel, spacing: CGFloat = 8, alignment: Alignment = .bottom) {
        self.init(frame: .zero)
        self.spacing = spacing
        self.alignment = alignment
        self.addArrangedSubview(firstLabel)
        self.addArrangedSubview(secondLabel)
    }
}
