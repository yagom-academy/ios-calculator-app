//
//  HistoryStackView.swift
//  Calculator
//
//  Created by 이차민 on 2021/11/19.
//

import UIKit

class HistoryStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(arrangedSubviews views: [UIView]) {
        super.init(frame: CGRect.zero)
        self.axis = .horizontal
        self.spacing = 10
        views.forEach {
            addArrangedSubview($0)
        }
    }        
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
