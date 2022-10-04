//
//  ScrollView+.swift
//  Calculator
//
//  Created by 미니 on 2022/09/29.
//

import UIKit

extension UIScrollView {
    func scrollToBottom(animated: Bool) {
        layoutIfNeeded()
        let offset = (contentSize.height - frame.height)
        let bottomOffset = CGPoint(x: 0, y: offset)
        setContentOffset(bottomOffset, animated: animated)
    }
}
