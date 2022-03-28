//
//  UIScrollView+Extension.swift
//  Calculator
//
//  Created by Lingo, mmim on 2022/03/28.
//

import UIKit

extension UIScrollView {
  
  func scrollToBottom() {
    self.layoutIfNeeded()
    let bottomOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height)
    self.setContentOffset(bottomOffset, animated: true)
  }
}
