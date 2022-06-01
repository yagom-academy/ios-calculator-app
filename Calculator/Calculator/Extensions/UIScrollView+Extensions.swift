//
//  UIScrollView.swift
//  Calculator
//
//  Created by Derrick kim on 2022/05/29.
//

import UIKit

extension UIScrollView {
   func focusBottom() {
       self.layoutIfNeeded()
       let height = self.contentSize.height - self.bounds.size.height
       let position = CGPoint(x: 0, y: height)
       self.setContentOffset(position, animated: true)
   }
}
