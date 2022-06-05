//
//  UIScrollView+Extensions.swift
//  Calculator
//
//  Created by 나이든별, 민쏜
//

import UIKit

extension UIScrollView {
    func scrollDownToBottom() {
        let bottomOffset = CGPoint(x: 0, y: self.frame.maxY)
        
        self.setContentOffset(bottomOffset, animated: false)
    }
}
