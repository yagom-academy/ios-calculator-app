//
//  scrollViewExtension.swift
//  Calculator
//
//  Created by 천승현 on 2023/02/06.
//

import UIKit

extension UIScrollView {
    func scrollToBottom() {
        if contentSize.height > bounds.size.height {
            let bottomEdge = contentSize.height - bounds.size.height
            setContentOffset(CGPoint(x: 0, y: bottomEdge), animated: true)
        }
    }
}
