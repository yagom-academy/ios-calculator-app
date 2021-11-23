//
//  FormulaLabel.swift
//  Calculator
//
//  Created by 이호영 on 2021/11/23.
//

import UIKit

class FormulaLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initializeLabel()
    }
    
    func initializeLabel() {
        textColor = .white
        font = UIFont.preferredFont(forTextStyle: .title3)
    }
}
