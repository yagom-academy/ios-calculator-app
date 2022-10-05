//
//  UIStackView+.swift
//  Created by SummerCat
//

import UIKit

extension UIStackView {
    func removeAllSubviews() {
        self.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }
}
