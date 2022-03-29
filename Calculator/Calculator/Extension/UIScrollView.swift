//
//  UIScrollView.swift
//  Calculator
//
//  Created by 조민호 on 2022/03/23.
//

import UIKit

extension UIScrollView {
    func scrollToBottom() {
        let delayTime = 0.1
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delayTime) {
            let bottomOffset = CGPoint(
                x: .zero,
                y: self.contentSize.height - self.bounds.size.height + self.contentInset.bottom)
            
            if(bottomOffset.y > .zero) {
                self.setContentOffset(bottomOffset, animated: true)
            }
        }
    }
}
