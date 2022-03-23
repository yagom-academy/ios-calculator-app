//
//  UIScrollView+Extension.swift
//  Calculator
//
//  Created by DuDu on 2022/03/22.
//

import UIKit

extension UIScrollView {
    func scroll() {
        DispatchQueue.main.async {[weak self] in
            guard let self = self else {
                return
            }
            
            let bottomOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height + self.contentInset.bottom)

            if bottomOffset.y > 0 {
                self.setContentOffset(bottomOffset, animated: true)
            }
        }
    }
}
