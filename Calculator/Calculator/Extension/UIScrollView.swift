//
//  UIScrollView.swift
//  Calculator
//
//  Created by 조민호 on 2022/03/23.
//

import UIKit

extension UIScrollView {
    func scrollToBottom() {
        self.layoutIfNeeded()
        
        let bottomOffset = CGPoint(
            x: 0,
            y: contentSize.height - bounds.size.height + contentInset.bottom)
        
        if(bottomOffset.y > 0) {
            setContentOffset(bottomOffset, animated: true)
        }
    }
}
