//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculatorDisplayLabel: UILabel!
    @IBOutlet weak var operatorDisplayLabel: UILabel!
    @IBOutlet weak var calculatorArchive: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculatorDisplayLabel.isAccessibilityElement = true
        calculatorDisplayLabel.accessibilityIdentifier = "calculatorDisplayLabel"
        
        operatorDisplayLabel.isAccessibilityElement = true
        operatorDisplayLabel.accessibilityIdentifier = "operatorDisplayLabel"
        
        calculatorArchive.isAccessibilityElement = true
        calculatorArchive.accessibilityIdentifier = "calculatorArchive"
        
    }

    @IBAction func numberButtonTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle,
            let displayText = calculatorDisplayLabel.text else {
            return
        }
        
        if displayText == "0" {
            calculatorDisplayLabel.text = title
        } else {
            calculatorDisplayLabel.text = displayText + title
        }
    }
    
    @IBAction func zeroButtonTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle,
            let displayText = calculatorDisplayLabel.text else {
            return
        }
        
        if displayText != "0" {
            calculatorDisplayLabel.text = displayText + title
        }
    }
    
    @IBAction func dotButtonTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle,
            let displayText = calculatorDisplayLabel.text else {
            return
        }
        
        calculatorDisplayLabel.text = displayText + title
    }
    
}

