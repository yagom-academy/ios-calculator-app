//
//  UIScrollView.swift
//  Calculator
//
//  Created by 박종화 on 2023/06/19.
//

import UIKit

extension UIScrollView {
    func scrollview(animated: Bool) {
        self.setContentOffset(CGPoint(x: 0, y: self.contentSize.height - self.bounds.height), animated: true)
    }
}
