//
//  StackViewContoroller.swift
//  Calculator
//
//  Created by Rowan on 2023/02/02.
//

import UIKit

final class CalculateItemScrollView: UIScrollView {
    override func didAddSubview(_ subview: UIView) {
        self.layoutIfNeeded()
        self.setContentOffset(CGPoint(x: 0, y: self.contentSize.height - self.bounds.height),
                              animated: true)
    }
}
