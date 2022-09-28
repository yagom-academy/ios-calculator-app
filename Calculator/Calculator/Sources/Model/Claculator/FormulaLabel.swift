//
//  FormulaLabel.swift
//  Calculator
//
//  Created by Gundy on 2022/09/29.
//

import UIKit

final class FormulaLabel: UILabel {
    func configure(text: String?) {
        self.text = text
        textColor = .white
        font = .preferredFont(forTextStyle: .title3)
    }
}
