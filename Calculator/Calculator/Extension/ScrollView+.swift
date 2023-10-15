//
//  scrollView+.swift
//  Calculator
//
//  Created by jyubong on 10/15/23.
//

import UIKit

extension UIScrollView {
    func scrollDown() {
        layoutIfNeeded()
        scrollRectToVisible(CGRect(x: 0, y: contentSize.height - bounds.size.height, width: bounds.size.width, height: bounds.size.height), animated: false)
    }
}
