//
//  UIScrollView+Extensions.swift
//  Calculator
//
//  Created by Gordon Choi on 2022/05/30.
//

import UIKit

extension UIScrollView {
    func scrollDownToBottom() {
        let bottomOffset = CGPoint(x: 0, y: self.frame.maxY)
        
        self.setContentOffset(bottomOffset, animated: false)
    }
}
