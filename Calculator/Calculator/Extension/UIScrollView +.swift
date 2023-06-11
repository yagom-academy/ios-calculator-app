//
//  UIScrollView +.swift
//  Calculator
//
//  Created by Hyungmin Lee on 2023/06/07.
//
import UIKit

extension UIScrollView {
    func scrollToBottom(animated: Bool) {
        self.setContentOffset(CGPoint(x: 0, y: self.contentSize.height - self.bounds.height), animated: animated)
    }
}

