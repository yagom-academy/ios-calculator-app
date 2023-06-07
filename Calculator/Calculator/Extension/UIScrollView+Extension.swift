//
//  UIScrollView+Extension.swift
//  Calculator
//
//  Created by Erick on 2023/06/07.
//

import UIKit

extension UIScrollView {
    func scrollToBottom(animated: Bool) {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.height + contentInset.bottom)
        setContentOffset(bottomOffset, animated: animated)
    }
}
