//
//  RoundedButton.swift
//  Calculator
//
//  Created by Harry on 2023/02/10.
//

import UIKit

class RoundedButton: UIButton {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layer.cornerRadius = self.frame.height / 2
    }
}
