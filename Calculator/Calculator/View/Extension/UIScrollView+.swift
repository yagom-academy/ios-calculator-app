//
//  UIScrollView+.swift
//  Calculator
//
//  Created by karen, Mary.
//

import UIKit

extension UIScrollView {
    func scrollToBottom() {
        let bottomOffset = CGPoint(x: 0,
                                   y: contentSize.height - bounds.size.height + contentInset.bottom)
        if(bottomOffset.y > 0) {
            setContentOffset(bottomOffset, animated: true)
        }
    }
}
