//
//  UIScrollView+Extexsion.swift
//  Calculator
//
//  Created by mmim.
//

import Foundation
import UIKit

extension UIScrollView {
    func scrollToBottom() {
        let bottomOffset = CGPoint(x: 0, y: self.frame.maxY)
        self.setContentOffset(bottomOffset, animated: false)
    }
}
