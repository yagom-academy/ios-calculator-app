//
//  CalculatorViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    private var temporaryOperandText: String = ""
    private var confirmedFormula: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func isValidTemporaryOperandTextDigitsLessFifteenCount() -> Bool {
        if temporaryOperandText.count > 15 {
            return false
        }
        return true
    }
}

