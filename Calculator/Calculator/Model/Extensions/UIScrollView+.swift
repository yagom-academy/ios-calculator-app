//
//  UIScrollView+.swift
//  Calculator
//
//  Created by SummerCat on 2022/09/30.
//

import Foundation
import UIKit

extension UIScrollView {
    func scrollToBottom(animated: Bool) {
        if self.contentSize.height < self.bounds.size.height + self.contentInset.bottom { return }
        let bottomOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height + contentInset.bottom)
        self.setContentOffset(bottomOffset, animated: animated)
    }
}
