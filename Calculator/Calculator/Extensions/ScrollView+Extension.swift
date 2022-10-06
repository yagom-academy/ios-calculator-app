//
//  ScrollView+Extension.swift
//  Calculator
//
//  Created by rhovin, LJ on 2022/10/06.
//

import UIKit

extension UIScrollView {
    func moveToBottomScroll() {
        self.setContentOffset(CGPoint(x: 0.0, y: self.contentSize.height - self.bounds.height),
                              animated: true)
    }
}
