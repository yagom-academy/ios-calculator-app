//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var currentNumberLabel: UILabel!
    @IBOutlet var currentOperatorLabel: UILabel!
    var currentNumberString = ""
    var currentOperator = ""
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func numberPressed(_ sender: UIButton) {
        guard let numberPressedString = sender.accessibilityIdentifier else {
            return
        }
        currentNumberString += numberPressedString
        update(label: self.currentNumberLabel, to: currentNumberString)
    }
    
    @IBAction func operatorButtonPressed(_ sender: UIButton) {
        // convert current buffer to UIStackView and add to UIScrollView
        // reset currentNumberLabel to 0
        guard let operatorPressedString = sender.accessibilityIdentifier else {
            return
        }
        currentOperator = operatorPressedString
        update(label: self.currentOperatorLabel, to: currentOperator)
    }
    
    private func update(label: UILabel, to data: String) {
        label.text = data
    }
}

