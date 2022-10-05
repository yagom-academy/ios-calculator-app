//
//  UIStackView.swift
//  Calculator
//
//  Created by 맹선아 on 2022/10/03.
//

import UIKit

extension UIStackView {
    func removeSubViewAll() {
        self.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
}
