//
//  ViewManager.swift
//  Calculator
//
//  Created by 리지, vetto, Andrew on 2023/02/09.
//

import UIKit


enum ViewManager {
    static func generateUILabel(_ name: String) -> UILabel {
        let label = UILabel()
        label.text = name
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }
    
    static func resetStackView(_ stackView: UIStackView) {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    static func scrollToBottom(_ scrollView: UIScrollView) {
        let bottomOffset = CGPoint(
            x: Number.origin,
            y: scrollView.contentSize.height - scrollView.bounds.height
        )
        scrollView.layoutIfNeeded()
        scrollView.setContentOffset(bottomOffset, animated: true)
    }
}

