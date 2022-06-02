//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorVC: UIViewController {
    // MARK: - Properties
    @IBOutlet private weak var operatorInput: UILabel!
    @IBOutlet private weak var numberInput: UILabel!
    
    // MARK: - Life Cycle
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        operatorInput.text = ""
        numberInput.text = "0"
    }
}

// MARK: - Actions

extension CalculatorVC {
    @IBAction private func numberButtonTapped(_ sender: UIButton) {
        if numberInput.text == "0" {
            numberInput.text = ""
        }
        
        numberInput?.text! += sender.currentTitle!
    }
    
    @IBAction private func operatorButtonTapped(_ sender: UIButton) {
        operatorInput.text = sender.currentTitle
    }
}

