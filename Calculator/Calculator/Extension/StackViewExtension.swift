//
//  StackViewExtension.swift
//  Calculator
//
//  Created by Hamo on 2022/10/05.
//

import UIKit

extension UIStackView {
    func removeAllSubViews() {
        self.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
}
