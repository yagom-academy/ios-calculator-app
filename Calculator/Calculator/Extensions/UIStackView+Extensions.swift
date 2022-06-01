//
//  UIStackView+Extensions.swift
//  Calculator
//
//  Created by Derrick kim on 2022/05/29.
//

import UIKit

extension UIStackView {
    var isEmpty: Bool { self.arrangedSubviews.isEmpty }
    
    func removeSubView() {
        self.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
}
