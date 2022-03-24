//
//  UIScrollView+Extension.swift
//  Calculator
//
//  Created by DuDu on 2022/03/22.
//

import UIKit

extension UIScrollView {
    func scrollToBottom() {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height)
        
        if bottomOffset.y > 0 {
            setContentOffset(bottomOffset, animated: true)
            layoutIfNeeded()
        }
    }
}
