//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorVC: UIViewController {
    // MARK: - Properties
    @IBOutlet private weak var operatorInputLabel: UILabel!
    @IBOutlet private weak var numberInputLabel: UILabel!
    
    // MARK: - Life Cycle
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        operatorInputLabel.text = ""
        numberInputLabel.text = "0"
    }
}

// MARK: - Actions

extension CalculatorVC {
    @IBAction private func numberButtonTapped(_ sender: UIButton) {
        if numberInputLabel.text == "0" {
            numberInputLabel.text = ""
        }
        
        numberInputLabel?.text! += sender.currentTitle!
    }
    
    @IBAction private func operatorButtonTapped(_ sender: UIButton) {
        operatorInputLabel.text = sender.currentTitle
    }
}

