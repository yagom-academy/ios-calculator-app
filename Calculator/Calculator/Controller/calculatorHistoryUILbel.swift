//
//  customUILable.swift
//  Calculator
//
//  Created by Eunsoo KIM on 2021/11/19.
//

import Foundation
import UIKit

class calculatorHistoryUILbel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(text: String) {
        super.init(frame: CGRect.zero)
        self.text = text
        self.textColor = UIColor.white
        self.font = UIFont.preferredFont(forTextStyle: .title3)
    }
}
