//
//  UIStrollView+Extension.swift
//  Calculator
//
//  Created by 노유빈 on 2022/09/28.
//

import UIKit

extension UIScrollView {
    func moveToBottom() {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height)
        setContentOffset(bottomOffset, animated: false)
    }
}
