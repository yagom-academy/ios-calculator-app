//
//  UIComponents+.swift
//  Calculator
//
//  Created by Minsup on 2023/06/07.
//

import UIKit

extension UILabel {
    var unwrappedText: String {
        return self.text ?? ""
    }
    
    static func generate(text: String) -> Self {
        let label = Self()
        label.text = text
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        
        return label
    }
}

extension UIButton {
    var unwrappedTitle: String {
        return self.titleLabel?.text ?? "error"
    }
    
    var sign: String {
        guard Operator.allCases.map({ String($0.rawValue) }).contains(self.titleLabel?.text) else { return "error" }
        return self.titleLabel?.text ?? "error"
    }
}
