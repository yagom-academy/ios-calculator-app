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
        layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height)
        self.setContentOffset(bottomOffset, animated: true)
    }
}
