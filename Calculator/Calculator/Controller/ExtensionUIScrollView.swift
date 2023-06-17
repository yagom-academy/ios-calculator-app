//
//  ExtensionUIScrollView.swift
//  Calculator
//
//  Created by kyungmin, EtialMoon on 2023/06/14.
//

import UIKit

extension UIScrollView {
    func scrollToBottom() {
        layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height)
        setContentOffset(bottomOffset, animated: true)
    }
}
