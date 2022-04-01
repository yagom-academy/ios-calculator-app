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
    let pointY = self.contentSize.height - self.bounds.size.height + self.contentInset.bottom
    let contentOffset = CGPoint(x: 0, y: pointY)
    self.setContentOffset(contentOffset, animated: true)
  }
}
