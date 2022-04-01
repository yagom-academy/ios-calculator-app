//
//  ScrollView+Extension.swift
//  Calculator
//
//  Created by SeoDongyeon on 2022/04/01.
//

import UIKit

extension UIScrollView {
    func scrollToBottom() {
        self.layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height)
        self.setContentOffset(bottomOffset, animated: true)
    }
}
