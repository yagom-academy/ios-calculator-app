//  FormulaLabel.swift
//  Created by zhilly and Gundy on 2022/10/04.

import UIKit

final class FormulaLabel: UILabel {
    func configure(text: String?) {
        self.text = text
        textColor = .white
        font = .preferredFont(forTextStyle: .title3)
    }
}
