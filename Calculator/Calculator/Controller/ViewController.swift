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
    
    private(set) var formula: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAccessibilityIndentifier()
    }
    
    func setAccessibilityIndentifier() {
        calculatorDisplayLabel.isAccessibilityElement = true
        calculatorDisplayLabel.accessibilityIdentifier = accessibilityIdentifier.calculatorDisplayLabel
        
        operatorDisplayLabel.isAccessibilityElement = true
        operatorDisplayLabel.accessibilityIdentifier = accessibilityIdentifier.operatorDisplayLabel
        
        calculatorArchive.isAccessibilityElement = true
        calculatorArchive.accessibilityIdentifier = accessibilityIdentifier.calculatorArchive
    }

    @IBAction func numberButtonTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle,
            let displayText = calculatorDisplayLabel.text else {
            return
        }
        
        if displayText == nameSpace.zero {
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
        
        if displayText != nameSpace.zero {
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
    
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle,
              let displayText = calculatorDisplayLabel.text,
              let operatorText = operatorDisplayLabel.text else {
            return
        }
        
        if displayText != nameSpace.zero {
            if formula.isEmpty {
                formula += displayText
            } else {
                formula += operatorText + displayText
            }
        }
        
        if formula.isEmpty == false {
            operatorDisplayLabel.text = title
        }
        calculatorDisplayLabel.text = nameSpace.zero
    }
}

