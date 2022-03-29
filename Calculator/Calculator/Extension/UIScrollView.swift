//
//  UIScrollView.swift
//  Calculator
//
//  Created by 조민호 on 2022/03/23.
//

import UIKit

extension UIScrollView {
    func scrollToBottom() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            let bottomOffset = CGPoint(
                x: 0,
                y: self.contentSize.height - self.bounds.size.height + self.contentInset.bottom)
            
            if(bottomOffset.y > .zero) {
                self.setContentOffset(bottomOffset, animated: true)
            }
        }
    }
}
