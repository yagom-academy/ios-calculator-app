//
//  ScrollView+.swift
//  Calculator
//
//  Created by 이경민 on 2022/09/29.
//

import UIKit

extension UIScrollView {
    func scrollToBottom() {
        layoutIfNeeded()
        let offset = (contentSize.height - frame.height)
        let bottomOffset = CGPoint(x: 0, y: offset)
        setContentOffset(bottomOffset, animated: true)
    }
}
