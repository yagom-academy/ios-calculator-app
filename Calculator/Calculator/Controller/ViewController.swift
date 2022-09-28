//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculatorDisplayLabel: UILabel!
    
    @IBOutlet weak var numberButton1: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculatorDisplayLabel.isAccessibilityElement = true
        calculatorDisplayLabel.accessibilityIdentifier = "calculatorDisplayLabel"
    }

    @IBAction func numberButtonTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle,
            let display = calculatorDisplayLabel.text else {
            return
        }
        
        if display == "0" {
            calculatorDisplayLabel.text = title
        } else {
            calculatorDisplayLabel.text = display + title
        }
    }
    
}

