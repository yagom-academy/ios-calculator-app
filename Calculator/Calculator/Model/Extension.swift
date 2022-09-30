//
//  Extension.swift
//  Calculator
//
//  Created by leewonseok on 2022/09/20.
//

import UIKit

extension Double: CalculateItem {
    
}

extension String {
    var isDouble: Bool {
        return Double(self) != nil ? true : false
    }
    
    func split(with target: Character) -> [String] {
        return split(separator: target).map { String($0) }
    }
}

extension Array {
    public subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}

extension UIStackView {
    func removeSubViewAll() {
        self.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
}
