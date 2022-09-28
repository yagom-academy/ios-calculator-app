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
            pushInFormula(operand: displayText, operator: operatorText)
            pushInArchive(operand: displayText, operator: operatorText)
        }
        
        if formula.isEmpty == false {
            operatorDisplayLabel.text = title
        }
        
        calculatorDisplayLabel.text = nameSpace.zero
    }
    
    func pushInFormula(operand: String, `operator`: String) {
        if self.formula.isEmpty {
            formula += operand
        } else {
            formula += `operator` + operand
        }
    }
    
    func pushInArchive(operand: String, `operator`: String) {
        let stackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.spacing = 8
            
            return stackView
        }()
        
        let operatorLabel = {
            let label = UILabel()
            label.text = `operator`
            label.textColor = .white
            label.font = UIFont.preferredFont(forTextStyle: .title3)
            
            return label
        }()
        
        let operandLabel = {
            let label = UILabel()
            label.text = operand
            label.textColor = .white
            label.font = UIFont.preferredFont(forTextStyle: .title3)
            
            return label
        }()
        
        stackView.addArrangedSubview(operatorLabel)
        stackView.addArrangedSubview(operandLabel)
        calculatorArchive.addArrangedSubview(stackView)
    }
    
    @IBAction func changeSignButtonTapped(_ sender: UIButton) {
        guard let displayText = calculatorDisplayLabel.text else {
            return
        }
        
        if displayText != nameSpace.zero {
            calculatorDisplayLabel.text = changeSign(displayText)
        }
    }
    
    func changeSign(_ text: String) -> String {
        if text.first == "-" {
            let secondIndex = text.index(after: text.startIndex)
            return String(text[secondIndex...])
        } else {
            return "-\(text)"
        }
    }
}

