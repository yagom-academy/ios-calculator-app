//
//  ScollView+Extension.swift
//  Calculator
//
//  Created by SeoDongyeon on 2022/03/25.
//

import UIKit

extension UIScrollView {
    func scrollToBottom(animated: Bool) {
        self.layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height)
        self.setContentOffset(bottomOffset, animated: animated)
    }
}
